
# 本库的作用

这个库是一个godot extension的moonbit语言binding，意在让moonbit语言可以使用godot的功能。

# 本库的binding思路

这个库的拷贝了godot_interface.h的头文件先放到gdext目录下。

然后对内容进行删改，保留copyright，和文档，一些不重要的宏，需要去除，无法决定的，就先保留。

对于头文件里定义的每一个函数，枚举，结构体定义，以及typedef，在保留文档的同时，做c-ffi，也就是c-api到moonbit-api的映射。

函数，枚举，结构体，以及typedef定义前的文档，需要调整注释格式，以`/// `（三个斜杠加一个空格）为每一行的开头，第一行需要以`///| `开头，后面跟着简介。文档的末尾，需要一个c代码块来指出原c函数的格式。

# C类型与Moonbit类型的转换

## 基本类型

C的基本类型大多可以直接与Moonbit类型进行对应：

1. `int`, `int32_t` -> `Int`
2. `long`, `int64_t` -> `Int64`
3. `unsigned`, `unsigned int`, `uint32_t` -> `UInt`
4. `unsigned long`, `uint64_t` -> `UInt64`
5. bool类型，只要这个bool类型用0代表false，用1代表true（极大部分库应该都是如此），就可以直接对应到moonbit的`Bool`
6. `short` -> `Int16`
7. `unsigned short` -> `UInt16`
8. `char`或者`uint8_t`可以直接对应到使用`Byte`
9. `void`作为函数参数的时候，代表什么都不做，作为函数的返回类型，在Moonbit里是`Unit`

**示例**：

```c
void foo(int x, long y, unsigned z);
```

在moonbit里做c-ffi为：

```mbt
extern "C" fn foo(x: Int, y: Int64, z: UInt) -> Unit = "foo"
```

## 结构体类型

对于C当中的结构体：

```c
typedef struct {
  int x;
  int y;
} Point;
```

对应到Moonbit里面，最简单的做法是：

```mbt
#external
pub type Point;
```

在Moonbit编译到C的过程中，所有这样定义的external type都会变成`void*`，这里也是一样，Point会在编译过程中变成`void*`。因此，在做ffi的时候要注意，如果参数是`Point*`，就不需要在额外地去做处理了。

```c
void foo(Point*);
```

```mbt
extern "C" fn foo(p: Point) -> Unit;
```

### 特别简单的结构体类型

除了直接定义外部类型，也可以在moonbit里按照C的定义来直接定义结构体：

```mbt
pub struct Point {
  x: Int
  y: Int
}
```

但是这么做会有一个问题，moonbit内部定义的类型会在类结构体负offset的位置添加一个GC的信息，这就导致如果这个结构体由C创建，会出现GC系统报错的问题，因此，当这个结构体经常作为函数的参数时，建议直接在moonbit里定义，如果这个结构体经常作为函数的返回值，需要额外地使用memcpy来拷贝数据。

```c
Point* create_point();
void print_point(Point*);
```

如果我们在Moonbit里直接定义了Point，`print_point`可以直接绑定，`create_point`需要做一个额外的处理：

```mbt
#external
type CPointRef  // 注意这里没有 `pub`

extern "C" fn __create_point() -> CPointRef = "create_point"

pub fn create_point() -> Point {
  let c_point_ref = __create_point()
  let mbt_point = Point::{ x: 0, y: 0}
  memcpy(mbt_point, c_point_ref, 8)  // 只能硬编码进行计算，如果不太好计算，最好就不要在Moonbit定义类型了。
  // free(c_point_ref)  // 视情况free掉c的point
}
```

总结一下什么情况下我们可能考虑在Moonbit里定义类型，而不是直接作为外部类型：这个类型比较简单，容易计算大小，且通常情况下是作为参数存在的，极少甚至不会作为返回值。

## Union类型

Moonbit没有能直接对应到Union的概念，只能定义成外部类型，然后用指针访问。

```c
typedef union {
  int a;
  char b[4];
} Bar;
```

```mbt
#external
pub type Bar;
```

## 枚举类型

对于没有赋值的c的`enum`，直接复刻:

```c
typedef enum {
  Red,
  Green,
  Blue
} Color;
```

在moonbit里：

```mbt
pub(all) enum Color {
  Red
  Green
  Blue
}
```

对于有赋值的`enum`，需要也同样写赋值：

```c
typedef enum {
  Red = 1,
  Green = 2,
  Blue = 4,
} Color;
```

```mbt
pub(all) enum {
  Red = 1
  Green = 2
  Blue = 4
}
```

## 指针类型

C的函数可能会有多个返回值，这些返回值通过指针传递并且改变，例如：

```c
bool get_int(int*);
```

像这样的C函数，对于参数的`int*`，在Moonbit里有两种可以编译成`int*`的结构，一个是`Ref[Int]`另一个是`FixedArray[Int]`，具体来说，对于任意的类型`T`，`Ref[T]`和`FixedArray[T]`都会编译成`T*`

`Ref[T]`只能适用于单个值的指针，`FixedArray[T]`更适用于多个值的指针，但也可以适用一个值的指针，通常情况下，更建议只使用`FixedArray[T]`，当遇到单个值时，构造长度为1的数组即可。

```mbt
extern "C" fn __get_int(input: FixedArray[Int]) -> Bool = "get_int"
```

**实践中的建议**：

为了让代码更加好用，我们通常情况下需要对ffi得到的函数进行二次封装：

```mbt
pub fn get_int() -> (Int, Bool) {
  let input : FixedArray[Int] = FixedArray::make(1, 0)
  let res = __get_int(input)
  (input[0], res)
}
```

如果是外部的类型，原理也是一样，注意外部类型都是指针类型，所以需要一个`nullptr()`函数来辅助：

```c
bool get_point(Point**);// 假设这个bool返回值告诉我们这个get能否返回正确的值。
```

注意上面是一个`Point**`。

在moonbit中：

```mbt
#external
pub type Point

pub suberror GetPointFailed // 定义一个错误类型

extern "C" fn __get_point(p:Point) -> Bool = "get_point"

pub fn get_point() -> Point raise GetPointFailed {
  let null_ptr: Point = nullptr();
  let point_ptr : FixedArray[Point] = FixedArray::make(1, null_ptr)
  let res = __get_point(point_ptr)
  if !res {
    raise GetPointFailed
  } else {
    point_ptr[0]
  }
}
```

## 数组类型

数组与指针有很多相似的地方，指针有时可以看做元素数量只有一个的数组，对于C来说，数组的传入通常是两个参数，一个指针和一个数量，对于ffi来说基本上差别不大，但对于二次封装来说，会有些差别：

```c
int sum(int* arr, int len);
```

在moonbit中做ffi，然后基于此进行二次开发：

```mbt
extern "C" fn __sum(arr: FixedArray[Int], len: Int) -> Int = "sum"

pub fn sum(arr: Array[Int]) -> Int {
  let arr_fixed = FixedArray::from_array(arr)
  let len = arr.length()
  __sum(arr_fixed, len)
}
```

对于外部类型也是一样的：

```c
bool draw(Point** pts, unsigned num_pts); // 返回是否成功的布尔值
```

```mbt
extern "C" fn __draw(pts: FixedArray[Point], num_pts: UInt) -> Bool = "draw"

pub suberror DrawFailed

pub fn draw(arr: Array[Point]) -> Unit raise {  // raise后面的错误可以省略，如果错误的类型不重要的话
  let arr_fixed = FixedArray::from_array(arr)
  let num_pts = arr.length()
  if !__draw(arr_fixed, num_pts) {
    raise DrawFailed
  }
}
```

## 字符串类型

C语言的字符串类型通常是`char*`，在Moonbit里最好是映射到`Bytes`

```c
void print_msg(const char* fmt, ...);
```

在moonbit里面没有va_arg这个概念，不过直接绑定就好了：

```mbt
extern "C" fn __print_msg(fmt: Bytes) -> Unit = "pint_msg"
```

但是在做二次开发的时候，要注意通常在moonbit里需要使用`String`，而moonbit的字符串`String`类型是一个utf-16标准的字符串数组，每一个字符是16位，我们需要进行转换：

```mbt
pub fn print_msg(msg: String) -> Unit {
  let cbytes = string_to_cbytes(msg)  // string_to_cbytes需要专门由人工实现，通常放在utils.mbt下。
  __print_msg(cbytes)
}
```

如果字符串是函数的返回值，也就是返回一个`char*`，返回值不可以是`Bytes`，因为`Bytes`是一个moonbit内部结构，此时需要定义一个外部类型`CStr`，然后专门做`CStr`的处理：

```c
const char* get_error();
```

```mbt
// CStr的定义通常放在utils.mbt下
// cstr_to_mbt_string 放在wrap.c下
#external
type CStr
extern "C" fn cstr_to_mbt_string(cstr: CStr) -> String = "cstr_to_mbt_string"

extern "C" fn __get_error() -> CStr = "get_error"

pub fn get_error() -> String {
  __get_error() |> cstr_to_mbt_string
}
```

## 函数指针

如果C的函数需要，或者返回一个函数指针，需要使用`FuncRef`

```c
void call_a_func(void(*f)());
int(*)(int, int) ret_a_bin():
```

moonbit里面：

```mbt
extern "C" fn call_a_func(a: FuncRef[() -> Unit]) = "call_a_func"

extern "C" fn ret_a_bin() -> FuncRef[(Int, Int) -> Int] = "ret_a_bin"
```

# 常见的错误

1. extern函数的返回值，为`String`, `Bytes`，`Ref[T]`, `FixedArray[T]`等Moonbit定义的复杂类型，但是绑定的函数却不在wrap.c里面。


# 补充说明

## 其它命令

- `moon check --target native` 进行静态分析

## 关于Moonbit

1. Moonbit有gc，没有rust的生命周期，所有权机制，没有引用。
2. rust习惯使用Result来进行异常处理，在Moonbit里面，尽量使用raise关键字，这样更灵活:

```mbt
pub suberror SomeError String

pub fn may_be_error(i: Int) -> Int raise SomeError {
  if i > 0 {
    100
  } else {
    raise SomeError("just a error")
  }
}

fn another_err() -> Int raise { // 可以省略Error，如果不想指定错误类型的话
  may_be_error(30)         // 在raise函数里可以直接调用另一个raise的函数，错误会向上传递
}

fn main {  // 在不能raise的函数里，必须做错误处理
  match (try? may_be_error(3)) {  // 有raise的函数可以通过try?语法把返回值转换成Result。
    Ok(_) => ()
    Err(_) => { ... }
  }
}
```
