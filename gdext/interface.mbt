//*************************************************************************/
//  gdextension_interface.h                                               */
//*************************************************************************/
//                         This file is part of:                          */
//                             GODOT ENGINE                               */
//                        https://godotengine.org                         */
//*************************************************************************/
// Copyright (c) 2014-present Godot Engine contributors (see AUTHORS.md). */
// Copyright (c) 2007-2014 Juan Linietsky, Ariel Manzur.                  */
//                                                                        */
// Permission is hereby granted, free of charge, to any person obtaining  */
// a copy of this software and associated documentation files (the        */
// "Software"), to deal in the Software without restriction, including    */
// without limitation the rights to use, copy, modify, merge, publish,    */
// distribute, sublicense, and/or sell copies of the Software, and to     */
// permit persons to whom the Software is furnished to do so, subject to  */
// the following conditions:                                              */
//                                                                        */
// The above copyright notice and this permission notice shall be         */
// included in all copies or substantial portions of the Software.        */
//                                                                        */
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,        */
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF     */
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. */
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY   */
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,   */
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE      */
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                 */
//*************************************************************************/


#external
pub type VoidPtr

// typedef uint32_t char32_t;
// typedef uint16_t char16_t;

pub typealias UInt as Char32
pub typealias UInt16 as Char16

///| Variant types
/// 
/// ```c
/// typedef enum {
/// 	GDEXTENSION_VARIANT_TYPE_NIL,
/// 
/// 	/*  atomic types */
/// 	GDEXTENSION_VARIANT_TYPE_BOOL,
/// 	GDEXTENSION_VARIANT_TYPE_INT,
/// 	GDEXTENSION_VARIANT_TYPE_FLOAT,
/// 	GDEXTENSION_VARIANT_TYPE_STRING,
/// 
/// 	/* math types */
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR2,
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR2I,
/// 	GDEXTENSION_VARIANT_TYPE_RECT2,
/// 	GDEXTENSION_VARIANT_TYPE_RECT2I,
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR3,
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR3I,
/// 	GDEXTENSION_VARIANT_TYPE_TRANSFORM2D,
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR4,
/// 	GDEXTENSION_VARIANT_TYPE_VECTOR4I,
/// 	GDEXTENSION_VARIANT_TYPE_PLANE,
/// 	GDEXTENSION_VARIANT_TYPE_QUATERNION,
/// 	GDEXTENSION_VARIANT_TYPE_AABB,
/// 	GDEXTENSION_VARIANT_TYPE_BASIS,
/// 	GDEXTENSION_VARIANT_TYPE_TRANSFORM3D,
/// 	GDEXTENSION_VARIANT_TYPE_PROJECTION,
/// 
/// 	/* misc types */
/// 	GDEXTENSION_VARIANT_TYPE_COLOR,
/// 	GDEXTENSION_VARIANT_TYPE_STRING_NAME,
/// 	GDEXTENSION_VARIANT_TYPE_NODE_PATH,
/// 	GDEXTENSION_VARIANT_TYPE_RID,
/// 	GDEXTENSION_VARIANT_TYPE_OBJECT,
/// 	GDEXTENSION_VARIANT_TYPE_CALLABLE,
/// 	GDEXTENSION_VARIANT_TYPE_SIGNAL,
/// 	GDEXTENSION_VARIANT_TYPE_DICTIONARY,
/// 	GDEXTENSION_VARIANT_TYPE_ARRAY,
/// 
/// 	/* typed arrays */
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY,
/// 	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR4_ARRAY,
/// 
/// 	GDEXTENSION_VARIANT_TYPE_VARIANT_MAX
/// } GDExtensionVariantType;
/// ```
pub(all) enum GDExtensionVariantType {
	GDEXTENSION_VARIANT_TYPE_NIL

	//  atomic types
	GDEXTENSION_VARIANT_TYPE_BOOL
	GDEXTENSION_VARIANT_TYPE_INT
	GDEXTENSION_VARIANT_TYPE_FLOAT
	GDEXTENSION_VARIANT_TYPE_STRING

	// math types
	GDEXTENSION_VARIANT_TYPE_VECTOR2
	GDEXTENSION_VARIANT_TYPE_VECTOR2I
	GDEXTENSION_VARIANT_TYPE_RECT2
	GDEXTENSION_VARIANT_TYPE_RECT2I
	GDEXTENSION_VARIANT_TYPE_VECTOR3
	GDEXTENSION_VARIANT_TYPE_VECTOR3I
	GDEXTENSION_VARIANT_TYPE_TRANSFORM2D
	GDEXTENSION_VARIANT_TYPE_VECTOR4
	GDEXTENSION_VARIANT_TYPE_VECTOR4I
	GDEXTENSION_VARIANT_TYPE_PLANE
	GDEXTENSION_VARIANT_TYPE_QUATERNION
	GDEXTENSION_VARIANT_TYPE_AABB
	GDEXTENSION_VARIANT_TYPE_BASIS
	GDEXTENSION_VARIANT_TYPE_TRANSFORM3D
	GDEXTENSION_VARIANT_TYPE_PROJECTION

	// misc types */
	GDEXTENSION_VARIANT_TYPE_COLOR
	GDEXTENSION_VARIANT_TYPE_STRING_NAME
	GDEXTENSION_VARIANT_TYPE_NODE_PATH
	GDEXTENSION_VARIANT_TYPE_RID
	GDEXTENSION_VARIANT_TYPE_OBJECT
	GDEXTENSION_VARIANT_TYPE_CALLABLE
	GDEXTENSION_VARIANT_TYPE_SIGNAL
	GDEXTENSION_VARIANT_TYPE_DICTIONARY
	GDEXTENSION_VARIANT_TYPE_ARRAY

	// typed arrays */
	GDEXTENSION_VARIANT_TYPE_PACKED_BYTE_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_INT32_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_INT64_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT32_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_FLOAT64_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_STRING_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR2_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR3_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_COLOR_ARRAY
	GDEXTENSION_VARIANT_TYPE_PACKED_VECTOR4_ARRAY

	GDEXTENSION_VARIANT_TYPE_VARIANT_MAX
}


///| Variant operators
///
/// ```c
/// typedef enum {
/// 	/* comparison */
/// 	GDEXTENSION_VARIANT_OP_EQUAL,
/// 	GDEXTENSION_VARIANT_OP_NOT_EQUAL,
/// 	GDEXTENSION_VARIANT_OP_LESS,
/// 	GDEXTENSION_VARIANT_OP_LESS_EQUAL,
/// 	GDEXTENSION_VARIANT_OP_GREATER,
/// 	GDEXTENSION_VARIANT_OP_GREATER_EQUAL,
/// 
/// 	/* mathematic */
/// 	GDEXTENSION_VARIANT_OP_ADD,
/// 	GDEXTENSION_VARIANT_OP_SUBTRACT,
/// 	GDEXTENSION_VARIANT_OP_MULTIPLY,
/// 	GDEXTENSION_VARIANT_OP_DIVIDE,
/// 	GDEXTENSION_VARIANT_OP_NEGATE,
/// 	GDEXTENSION_VARIANT_OP_POSITIVE,
/// 	GDEXTENSION_VARIANT_OP_MODULE,
/// 	GDEXTENSION_VARIANT_OP_POWER,
/// 
/// 	/* bitwise */
/// 	GDEXTENSION_VARIANT_OP_SHIFT_LEFT,
/// 	GDEXTENSION_VARIANT_OP_SHIFT_RIGHT,
/// 	GDEXTENSION_VARIANT_OP_BIT_AND,
/// 	GDEXTENSION_VARIANT_OP_BIT_OR,
/// 	GDEXTENSION_VARIANT_OP_BIT_XOR,
/// 	GDEXTENSION_VARIANT_OP_BIT_NEGATE,
/// 
/// 	/* logic */
/// 	GDEXTENSION_VARIANT_OP_AND,
/// 	GDEXTENSION_VARIANT_OP_OR,
/// 	GDEXTENSION_VARIANT_OP_XOR,
/// 	GDEXTENSION_VARIANT_OP_NOT,
/// 
/// 	/* containment */
/// 	GDEXTENSION_VARIANT_OP_IN,
/// 	GDEXTENSION_VARIANT_OP_MAX
/// 
/// } GDExtensionVariantOperator;
/// ```
pub(all) enum GDExtensionVariantOperator {
  // comparison
  GDEXTENSION_VARIANT_OP_EQUAL
  GDEXTENSION_VARIANT_OP_NOT_EQUAL
  GDEXTENSION_VARIANT_OP_LESS
  GDEXTENSION_VARIANT_OP_LESS_EQUAL
  GDEXTENSION_VARIANT_OP_GREATER
  GDEXTENSION_VARIANT_OP_GREATER_EQUAL

  // mathematic
  GDEXTENSION_VARIANT_OP_ADD
  GDEXTENSION_VARIANT_OP_SUBTRACT
  GDEXTENSION_VARIANT_OP_MULTIPLY
  GDEXTENSION_VARIANT_OP_DIVIDE
  GDEXTENSION_VARIANT_OP_NEGATE
  GDEXTENSION_VARIANT_OP_POSITIVE
  GDEXTENSION_VARIANT_OP_MODULE
  GDEXTENSION_VARIANT_OP_POWER

  // bitwise
  GDEXTENSION_VARIANT_OP_SHIFT_LEFT
  GDEXTENSION_VARIANT_OP_SHIFT_RIGHT
  GDEXTENSION_VARIANT_OP_BIT_AND
  GDEXTENSION_VARIANT_OP_BIT_OR
  GDEXTENSION_VARIANT_OP_BIT_XOR
  GDEXTENSION_VARIANT_OP_BIT_NEGATE

  // logic
  GDEXTENSION_VARIANT_OP_AND
  GDEXTENSION_VARIANT_OP_OR
  GDEXTENSION_VARIANT_OP_XOR
  GDEXTENSION_VARIANT_OP_NOT

  // containment */
  GDEXTENSION_VARIANT_OP_IN

  GDEXTENSION_VARIANT_OP_MAX
}

/// In this API there are multiple functions which expect the caller to pass a pointer
/// on return value as parameter.
/// In order to make it clear if the caller should initialize the return value or not
/// we have two flavor of types:
/// - `GDExtensionXXXPtr` for pointer on an initialized value
/// - `GDExtensionUninitializedXXXPtr` for pointer on uninitialized value
///
/// Notes:
/// - Not respecting those requirements can seems harmless, but will lead to unexpected
///   segfault or memory leak (for instance with a specific compiler/OS, or when two
///   native extensions start doing ptrcall on each other).
/// - Initialization must be done with the function pointer returned by `variant_get_ptr_constructor`,
///   zero-initializing the variable should not be considered a valid initialization method here !
/// - Some types have no destructor (see `extension_api.json`'s `has_destructor` field), for
///   them it is always safe to skip the constructor for the return value if you are in a hurry ;-)

/// ```c
/// typedef void *GDExtensionVariantPtr;
/// ```
#external
pub type GDExtensionVariantPtr;

/// ```c
/// typedef const void *GDExtensionConstVariantPtr;
/// ```
#external
pub type GDExtensionConstVariantPtr;

/// ```c
/// typedef void *GDExtensionUninitializedVariantPtr;
/// ```
#external
pub type GDExtensionUninitializedVariantPtr;

/// ```c
/// typedef void *GDExtensionStringNamePtr;
/// ```
#external
pub type GDExtensionStringNamePtr;

/// ```c
/// typedef const void *GDExtensionConstStringNamePtr;
/// ```
#external
pub type GDExtensionConstStringNamePtr;

/// ```c
/// typedef void *GDExtensionUninitializedStringNamePtr;
/// ```
#external
pub type GDExtensionUninitializedStringNamePtr;

/// ```c
/// typedef void *GDExtensionStringPtr;
/// ```
#external
pub type GDExtensionStringPtr;

/// ```c
/// typedef const void *GDExtensionConstStringPtr;
/// ```
#external
pub type GDExtensionConstStringPtr;

/// ```c
/// typedef void *GDExtensionUninitializedStringPtr;
/// ```
#external
pub type GDExtensionUninitializedStringPtr;

/// ```c
/// typedef void *GDExtensionObjectPtr;
/// ```
#external
pub type GDExtensionObjectPtr;

/// ```c
/// typedef const void *GDExtensionConstObjectPtr;
/// ```
#external
pub type GDExtensionConstObjectPtr;

/// ```c
/// typedef void *GDExtensionUninitializedObjectPtr;
/// ```
#external
pub type GDExtensionUninitializedObjectPtr;

/// ```c
/// typedef void *GDExtensionTypePtr;
/// ```
#external
pub type GDExtensionTypePtr;

/// ```c
/// typedef const void *GDExtensionConstTypePtr;
/// ```
#external
pub type GDExtensionConstTypePtr;

/// ```c
/// typedef void *GDExtensionUninitializedTypePtr;
/// ```
#external
pub type GDExtensionUninitializedTypePtr;

/// ```c
/// typedef const void *GDExtensionMethodBindPtr;
/// ```
#external
pub type GDExtensionMethodBindPtr;

/// ```c
/// typedef int64_t GDExtensionInt;
/// ```
pub typealias Int64 as GDExtensionInt

/// ```c
/// typedef uint8_t GDExtensionBool;
/// ```
pub typealias Byte as GDExtensionBool

/// ```c
/// typedef uint64_t GDObjectInstanceID;
/// ```
pub typealias UInt64 as GDObjectInstanceID

/// ```c
/// typedef void *GDExtensionRefPtr;
/// ```
#external
pub type GDExtensionRefPtr

/// ```c
/// typedef const void *GDExtensionConstRefPtr;
/// ```
#external
pub type GDExtensionConstRefPtr


/// ---------- VARIANT DATA I/O 

///```c
/// typedef enum {
/// 	GDEXTENSION_CALL_OK,
/// 	GDEXTENSION_CALL_ERROR_INVALID_METHOD,
/// 	GDEXTENSION_CALL_ERROR_INVALID_ARGUMENT, // Expected a different variant type.
/// 	GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS, // Expected lower number of arguments.
/// 	GDEXTENSION_CALL_ERROR_TOO_FEW_ARGUMENTS, // Expected higher number of arguments.
/// 	GDEXTENSION_CALL_ERROR_INSTANCE_IS_NULL,
/// 	GDEXTENSION_CALL_ERROR_METHOD_NOT_CONST, // Used for const call.
/// } GDExtensionCallErrorType;
/// ```
pub(all) enum GDExtensionCallErrorType {
  GDEXTENSION_CALL_OK
  GDEXTENSION_CALL_ERROR_INVALID_METHOD
  GDEXTENSION_CALL_ERROR_INVALID_ARGUMENT
  GDEXTENSION_CALL_ERROR_TOO_MANY_ARGUMENTS
  GDEXTENSION_CALL_ERROR_TOO_FEW_ARGUMENTS
  GDEXTENSION_CALL_ERROR_INSTANCE_IS_NULL
  GDEXTENSION_CALL_ERROR_METHOD_NOT_CONST
}


/// ```c
/// typedef struct {
/// 	GDExtensionCallErrorType error;
/// 	int32_t argument;
/// 	int32_t expected;
/// } GDExtensionCallError;
/// ```
pub(all) struct GDExtensionCallError {
  error: GDExtensionCallErrorType
  argument: Int64 // int32_t
  expected: Int64 // int32_t
}

/// ```c
/// typedef void (*GDExtensionVariantFromTypeConstructorFunc)(GDExtensionUninitializedVariantPtr, GDExtensionTypePtr);
/// ```
pub typealias FuncRef[(GDExtensionUninitializedVariantPtr,  GDExtensionTypePtr) -> Unit] as GDExtensionVariantFromTypeConstructorFunc

/// ```c
/// typedef void (*GDExtensionTypeFromVariantConstructorFunc)(GDExtensionUninitializedTypePtr, GDExtensionVariantPtr);
/// ```
pub typealias FuncRef[(GDExtensionUninitializedTypePtr, GDExtensionVariantPtr) -> Unit] as GDExtensionTypeFromVariantConstructorFunc

/// ```c
/// typedef void *(*GDExtensionVariantGetInternalPtrFunc)(GDExtensionVariantPtr);
/// ```
pub typealias FuncRef[(GDExtensionVariantPtr) -> GDExtensionRefPtr] as GDExtensionVariantGetInternalPtrFunc

/// ```c
/// typedef void (*GDExtensionPtrOperatorEvaluator)(GDExtensionConstTypePtr p_left, GDExtensionConstTypePtr p_right, GDExtensionTypePtr r_result);
/// ```
pub typealias FuncRef[(GDExtensionConstTypePtr, GDExtensionConstTypePtr, GDExtensionTypePtr) -> Unit] as GDExtensionPtrOperatorEvaluator

/// ```c
/// typedef void (*GDExtensionPtrBuiltInMethod)(GDExtensionTypePtr p_base, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_return, int p_argument_count);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr, GDExtensionConstTypePtr, GDExtensionTypePtr, Int) -> Unit] as GDExtensionPtrBuiltInMethod

/// ```c
/// typedef void (*GDExtensionPtrConstructor)(GDExtensionUninitializedTypePtr p_base, const GDExtensionConstTypePtr *p_args);
/// ```
pub typealias FuncRef[(GDExtensionUninitializedTypePtr, GDExtensionConstTypePtr) -> Unit] as GDExtensionPtrConstructor

/// ```c
/// typedef void (*GDExtensionPtrDestructor)(GDExtensionTypePtr p_base);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr) -> Unit] as GDExtensionPtrDestructor

/// ```c
/// typedef void (*GDExtensionPtrSetter)(GDExtensionTypePtr p_base, GDExtensionConstTypePtr p_value);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr, GDExtensionConstTypePtr) -> Unit] as GDExtensionPtrSetter

/// ```c
/// typedef void (*GDExtensionPtrGetter)(GDExtensionConstTypePtr p_base, GDExtensionTypePtr r_value);
/// ```
pub typealias FuncRef[(GDExtensionConstTypePtr, GDExtensionTypePtr) -> Unit] as GDExtensionPtrGetter

/// ```c
/// typedef void (*GDExtensionPtrIndexedSetter)(GDExtensionTypePtr p_base, GDExtensionInt p_index, GDExtensionConstTypePtr p_value);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr, GDExtensionInt, GDExtensionConstTypePtr) -> Unit] as GDExtensionPtrIndexedSetter

/// ```c
/// typedef void (*GDExtensionPtrIndexedGetter)(GDExtensionConstTypePtr p_base, GDExtensionInt p_index, GDExtensionTypePtr r_value);
/// ```
pub typealias FuncRef[(GDExtensionConstTypePtr, GDExtensionInt, GDExtensionTypePtr) -> Unit] as GDExtensionPtrIndexedGetter

/// ```c
/// typedef void (*GDExtensionPtrKeyedSetter)(GDExtensionTypePtr p_base, GDExtensionConstTypePtr p_key, GDExtensionConstTypePtr p_value);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr, GDExtensionConstTypePtr, GDExtensionConstTypePtr) -> Unit] as GDExtensionPtrKeyedSetter

/// ```c
/// typedef void (*GDExtensionPtrKeyedGetter)(GDExtensionConstTypePtr p_base, GDExtensionConstTypePtr p_key, GDExtensionTypePtr r_value);
/// ```
pub typealias FuncRef[(GDExtensionConstTypePtr, GDExtensionConstTypePtr, GDExtensionTypePtr) -> Unit] as GDExtensionPtrKeyedGetter

/// ```c
/// typedef uint32_t (*GDExtensionPtrKeyedChecker)(GDExtensionConstVariantPtr p_base, GDExtensionConstVariantPtr p_key);
/// ```
pub typealias FuncRef[(GDExtensionConstVariantPtr, GDExtensionConstVariantPtr) -> UInt] as GDExtensionPtrKeyedChecker

/// ```c
/// typedef void (*GDExtensionPtrUtilityFunction)(GDExtensionTypePtr r_return, const GDExtensionConstTypePtr *p_args, int p_argument_count);
/// ```
pub typealias FuncRef[(GDExtensionTypePtr, GDExtensionConstTypePtr, Int) -> Unit] as GDExtensionPtrUtilityFunction

/// ```c
/// typedef GDExtensionObjectPtr (*GDExtensionClassConstructor)();
/// ```
pub typealias FuncRef[() -> GDExtensionObjectPtr] as GDExtensionClassConstructor

/// ```c
/// typedef void *(*GDExtensionInstanceBindingCreateCallback)(void *p_token, void *p_instance);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionObjectPtr) -> GDExtensionRefPtr] as GDExtensionInstanceBindingCreateCallback;

/// ```c
/// typedef void (*GDExtensionInstanceBindingFreeCallback)(void *p_token, void *p_instance, void *p_binding);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionObjectPtr, GDExtensionRefPtr) -> Unit] as GDExtensionInstanceBindingFreeCallback;

/// ```c
/// typedef GDExtensionBool (*GDExtensionInstanceBindingReferenceCallback)(void *p_token, void *p_binding, GDExtensionBool p_reference);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionRefPtr, GDExtensionBool) -> GDExtensionBool] as GDExtensionInstanceBindingReferenceCallback;

/// ```c
/// typedef struct {
/// 	GDExtensionInstanceBindingCreateCallback create_callback;
/// 	GDExtensionInstanceBindingFreeCallback free_callback;
/// 	GDExtensionInstanceBindingReferenceCallback reference_callback;
/// } GDExtensionInstanceBindingCallbacks;
/// ```
pub(all) struct GDExtensionInstanceBindingCallbacks {
	create_callback: GDExtensionInstanceBindingCreateCallback
	free_callback: GDExtensionInstanceBindingFreeCallback
	reference_callback: GDExtensionInstanceBindingReferenceCallback
}


/// --- EXTENSION CLASSES */

/// ```c
/// typedef void *GDExtensionClassInstancePtr;
/// ```
#external
pub type GDExtensionClassInstancePtr;

/// ```c
/// typedef GDExtensionBool (*GDExtensionClassSet)(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstStringNamePtr, GDExtensionConstVariantPtr) -> GDExtensionBool] as GDExtensionClassSet;

/// ```c
/// typedef GDExtensionBool (*GDExtensionClassGet)(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstStringNamePtr, GDExtensionVariantPtr) -> GDExtensionBool] as GDExtensionClassGet;

/// ```c
/// typedef uint64_t (*GDExtensionClassGetRID)(GDExtensionClassInstancePtr p_instance);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr) -> UInt64] as GDExtensionClassGetRID;

/// ```c
/// typedef struct {
/// 	GDExtensionVariantType type;
/// 	GDExtensionStringNamePtr name;
/// 	GDExtensionStringNamePtr class_name;
/// 	uint32_t hint; // Bitfield of `PropertyHint` (defined in `extension_api.json`).
/// 	GDExtensionStringPtr hint_string;
/// 	uint32_t usage; // Bitfield of `PropertyUsageFlags` (defined in `extension_api.json`).
/// } GDExtensionPropertyInfo;
/// ```
pub(all) struct GDExtensionPropertyInfo {
	type_: GDExtensionVariantType
	name: GDExtensionStringNamePtr
	class_name: GDExtensionStringNamePtr
	hint: UInt // uint32_t
	hint_string: GDExtensionStringPtr
	usage: UInt // uint32_t
}

/// ```c
/// typedef struct {
/// 	GDExtensionStringNamePtr name;
/// 	GDExtensionPropertyInfo return_value;
/// 	uint32_t flags; // Bitfield of `GDExtensionClassMethodFlags`.
/// 	int32_t id;
/// 
/// 	/* Arguments: `default_arguments` is an array of size `argument_count`. */
/// 	uint32_t argument_count;
/// 	GDExtensionPropertyInfo *arguments;
/// 
/// 	/* Default arguments: `default_arguments` is an array of size `default_argument_count`. */
/// 	uint32_t default_argument_count;
/// 	GDExtensionVariantPtr *default_arguments;
/// } GDExtensionMethodInfo;
/// ```
pub(all) struct GDExtensionMethodInfo {
	name: GDExtensionStringNamePtr
	return_value: GDExtensionPropertyInfo
	flags: UInt
	id: Int64
	argument_count: UInt
	arguments: GDExtensionPropertyInfo
	default_argument_count: UInt
	default_arguments: GDExtensionVariantPtr
}

/// ```c
/// typedef const GDExtensionPropertyInfo *(*GDExtensionClassGetPropertyList)(GDExtensionClassInstancePtr p_instance, uint32_t *r_count);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, UInt) -> GDExtensionPropertyInfo] as GDExtensionClassGetPropertyList

/// ```c
/// typedef void (*GDExtensionClassFreePropertyList)(GDExtensionClassInstancePtr p_instance, const GDExtensionPropertyInfo *p_list);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionPropertyInfo) -> Unit] as GDExtensionClassFreePropertyList

/// ```c
/// typedef void (*GDExtensionClassFreePropertyList2)(GDExtensionClassInstancePtr p_instance, const GDExtensionPropertyInfo *p_list, uint32_t p_count);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionPropertyInfo, UInt) -> Unit] as GDExtensionClassFreePropertyList2

/// ```c
/// typedef GDExtensionBool (*GDExtensionClassPropertyCanRevert)(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstStringNamePtr) -> GDExtensionBool] as GDExtensionClassPropertyCanRevert

/// ```c
/// typedef GDExtensionBool (*GDExtensionClassPropertyGetRevert)(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstStringNamePtr, GDExtensionVariantPtr) -> GDExtensionBool] as GDExtensionClassPropertyGetRevert

/// ```c
/// typedef GDExtensionBool (*GDExtensionClassValidateProperty)(GDExtensionClassInstancePtr p_instance, GDExtensionPropertyInfo *p_property);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionPropertyInfo) -> GDExtensionBool] as GDExtensionClassValidateProperty

/// ```c
/// typedef void (*GDExtensionClassNotification)(GDExtensionClassInstancePtr p_instance, int32_t p_what); // Deprecated. Use GDExtensionClassNotification2 instead.
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, Int) -> Unit] as GDExtensionClassNotification

/// ```c
/// typedef void (*GDExtensionClassNotification2)(GDExtensionClassInstancePtr p_instance, int32_t p_what, GDExtensionBool p_reversed);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, Int, GDExtensionBool) -> Unit] as GDExtensionClassNotification2

/// ```c
/// typedef void (*GDExtensionClassToString)(GDExtensionClassInstancePtr p_instance, GDExtensionBool *r_is_valid, GDExtensionStringPtr p_out);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionBool, GDExtensionStringPtr) -> Unit] as GDExtensionClassToString

/// ```c
/// typedef void (*GDExtensionClassReference)(GDExtensionClassInstancePtr p_instance);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr) -> Unit] as GDExtensionClassReference

/// ```c
/// typedef void (*GDExtensionClassUnreference)(GDExtensionClassInstancePtr p_instance);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr) -> Unit] as GDExtensionClassUnreference

/// ```c
/// typedef void (*GDExtensionClassCallVirtual)(GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstTypePtr, GDExtensionTypePtr) -> Unit] as GDExtensionClassCallVirtual

/// ```c
/// typedef GDExtensionObjectPtr (*GDExtensionClassCreateInstance)(void *p_class_userdata);
/// ```
pub typealias FuncRef[(VoidPtr) -> GDExtensionObjectPtr] as GDExtensionClassCreateInstance

/// ```c
/// typedef GDExtensionObjectPtr (*GDExtensionClassCreateInstance2)(void *p_class_userdata, GDExtensionBool p_notify_postinitialize);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionBool) -> GDExtensionObjectPtr] as GDExtensionClassCreateInstance2

/// ```c
/// typedef void (*GDExtensionClassFreeInstance)(void *p_class_userdata, GDExtensionClassInstancePtr p_instance);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionClassInstancePtr) -> Unit] as GDExtensionClassFreeInstance

/// ```c
/// typedef GDExtensionClassInstancePtr (*GDExtensionClassRecreateInstance)(void *p_class_userdata, GDExtensionObjectPtr p_object);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionObjectPtr) -> GDExtensionClassInstancePtr] as GDExtensionClassRecreateInstance
/// ```c
/// typedef GDExtensionClassCallVirtual (*GDExtensionClassGetVirtual)(void *p_class_userdata, GDExtensionConstStringNamePtr p_name);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionConstStringNamePtr) -> GDExtensionClassCallVirtual] as GDExtensionClassGetVirtual

/// ```c
/// typedef GDExtensionClassCallVirtual (*GDExtensionClassGetVirtual2)(void *p_class_userdata, GDExtensionConstStringNamePtr p_name, uint32_t p_hash);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionConstStringNamePtr, UInt) -> GDExtensionClassCallVirtual] as GDExtensionClassGetVirtual2

/// ```c
/// typedef void *(*GDExtensionClassGetVirtualCallData)(void *p_class_userdata, GDExtensionConstStringNamePtr p_name);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionConstStringNamePtr) -> VoidPtr] as GDExtensionClassGetVirtualCallData

/// ```c
/// typedef void *(*GDExtensionClassGetVirtualCallData2)(void *p_class_userdata, GDExtensionConstStringNamePtr p_name, uint32_t p_hash);
/// ```
pub typealias FuncRef[(VoidPtr, GDExtensionConstStringNamePtr, UInt) -> VoidPtr] as GDExtensionClassGetVirtualCallData2

/// ```c
/// typedef void (*GDExtensionClassCallVirtualWithData)(GDExtensionClassInstancePtr p_instance, GDExtensionConstStringNamePtr p_name, void *p_virtual_call_userdata, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret);
/// ```
pub typealias FuncRef[(GDExtensionClassInstancePtr, GDExtensionConstStringNamePtr, VoidPtr, GDExtensionConstTypePtr, GDExtensionTypePtr) -> Unit] as GDExtensionClassCallVirtualWithData
/// 
/// typedef struct {
/// 	GDExtensionBool is_virtual;
/// 	GDExtensionBool is_abstract;
/// 	GDExtensionClassSet set_func;
/// 	GDExtensionClassGet get_func;
/// 	GDExtensionClassGetPropertyList get_property_list_func;
/// 	GDExtensionClassFreePropertyList free_property_list_func;
/// 	GDExtensionClassPropertyCanRevert property_can_revert_func;
/// 	GDExtensionClassPropertyGetRevert property_get_revert_func;
/// 	GDExtensionClassNotification notification_func;
/// 	GDExtensionClassToString to_string_func;
/// 	GDExtensionClassReference reference_func;
/// 	GDExtensionClassUnreference unreference_func;
/// 	GDExtensionClassCreateInstance create_instance_func; // (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
/// 	GDExtensionClassFreeInstance free_instance_func; // Destructor; mandatory.
/// 	GDExtensionClassGetVirtual get_virtual_func; // Queries a virtual function by name and returns a callback to invoke the requested virtual function.
/// 	GDExtensionClassGetRID get_rid_func;
/// 	void *class_userdata; // Per-class user data, later accessible in instance bindings.
/// } GDExtensionClassCreationInfo; // Deprecated. Use GDExtensionClassCreationInfo4 instead.
/// 
/// typedef struct {
/// 	GDExtensionBool is_virtual;
/// 	GDExtensionBool is_abstract;
/// 	GDExtensionBool is_exposed;
/// 	GDExtensionClassSet set_func;
/// 	GDExtensionClassGet get_func;
/// 	GDExtensionClassGetPropertyList get_property_list_func;
/// 	GDExtensionClassFreePropertyList free_property_list_func;
/// 	GDExtensionClassPropertyCanRevert property_can_revert_func;
/// 	GDExtensionClassPropertyGetRevert property_get_revert_func;
/// 	GDExtensionClassValidateProperty validate_property_func;
/// 	GDExtensionClassNotification2 notification_func;
/// 	GDExtensionClassToString to_string_func;
/// 	GDExtensionClassReference reference_func;
/// 	GDExtensionClassUnreference unreference_func;
/// 	GDExtensionClassCreateInstance create_instance_func; // (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
/// 	GDExtensionClassFreeInstance free_instance_func; // Destructor; mandatory.
/// 	GDExtensionClassRecreateInstance recreate_instance_func;
/// 	// Queries a virtual function by name and returns a callback to invoke the requested virtual function.
/// 	GDExtensionClassGetVirtual get_virtual_func;
/// 	// Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
/// 	// need or benefit from extra data when calling virtual functions.
/// 	// Returns user data that will be passed to `call_virtual_with_data_func`.
/// 	// Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
/// 	// Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
/// 	// You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
/// 	GDExtensionClassGetVirtualCallData get_virtual_call_data_func;
/// 	// Used to call virtual functions when `get_virtual_call_data_func` is not null.
/// 	GDExtensionClassCallVirtualWithData call_virtual_with_data_func;
/// 	GDExtensionClassGetRID get_rid_func;
/// 	void *class_userdata; // Per-class user data, later accessible in instance bindings.
/// } GDExtensionClassCreationInfo2; // Deprecated. Use GDExtensionClassCreationInfo4 instead.
/// 
/// typedef struct {
/// 	GDExtensionBool is_virtual;
/// 	GDExtensionBool is_abstract;
/// 	GDExtensionBool is_exposed;
/// 	GDExtensionBool is_runtime;
/// 	GDExtensionConstStringPtr icon_path;
/// 	GDExtensionClassSet set_func;
/// 	GDExtensionClassGet get_func;
/// 	GDExtensionClassGetPropertyList get_property_list_func;
/// 	GDExtensionClassFreePropertyList2 free_property_list_func;
/// 	GDExtensionClassPropertyCanRevert property_can_revert_func;
/// 	GDExtensionClassPropertyGetRevert property_get_revert_func;
/// 	GDExtensionClassValidateProperty validate_property_func;
/// 	GDExtensionClassNotification2 notification_func;
/// 	GDExtensionClassToString to_string_func;
/// 	GDExtensionClassReference reference_func;
/// 	GDExtensionClassUnreference unreference_func;
/// 	GDExtensionClassCreateInstance2 create_instance_func; // (Default) constructor; mandatory. If the class is not instantiable, consider making it virtual or abstract.
/// 	GDExtensionClassFreeInstance free_instance_func; // Destructor; mandatory.
/// 	GDExtensionClassRecreateInstance recreate_instance_func;
/// 	// Queries a virtual function by name and returns a callback to invoke the requested virtual function.
/// 	GDExtensionClassGetVirtual2 get_virtual_func;
/// 	// Paired with `call_virtual_with_data_func`, this is an alternative to `get_virtual_func` for extensions that
/// 	// need or benefit from extra data when calling virtual functions.
/// 	// Returns user data that will be passed to `call_virtual_with_data_func`.
/// 	// Returning `NULL` from this function signals to Godot that the virtual function is not overridden.
/// 	// Data returned from this function should be managed by the extension and must be valid until the extension is deinitialized.
/// 	// You should supply either `get_virtual_func`, or `get_virtual_call_data_func` with `call_virtual_with_data_func`.
/// 	GDExtensionClassGetVirtualCallData2 get_virtual_call_data_func;
/// 	// Used to call virtual functions when `get_virtual_call_data_func` is not null.
/// 	GDExtensionClassCallVirtualWithData call_virtual_with_data_func;
/// 	void *class_userdata; // Per-class user data, later accessible in instance bindings.
/// } GDExtensionClassCreationInfo4;
/// 
/// typedef void *GDExtensionClassLibraryPtr;
/// 
/// /* Passed a pointer to a PackedStringArray that should be filled with the classes that may be used by the GDExtension. */
/// typedef void (*GDExtensionEditorGetClassesUsedCallback)(GDExtensionTypePtr p_packed_string_array);
/// 
/// /* Method */
/// 
/// typedef enum {
/// 	GDEXTENSION_METHOD_FLAG_NORMAL = 1,
/// 	GDEXTENSION_METHOD_FLAG_EDITOR = 2,
/// 	GDEXTENSION_METHOD_FLAG_CONST = 4,
/// 	GDEXTENSION_METHOD_FLAG_VIRTUAL = 8,
/// 	GDEXTENSION_METHOD_FLAG_VARARG = 16,
/// 	GDEXTENSION_METHOD_FLAG_STATIC = 32,
/// 	GDEXTENSION_METHOD_FLAGS_DEFAULT = GDEXTENSION_METHOD_FLAG_NORMAL,
/// } GDExtensionClassMethodFlags;
/// 
/// typedef enum {
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_NONE,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT8,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT16,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT32,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_INT64,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT8,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT16,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT32,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_UINT64,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_FLOAT,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_REAL_IS_DOUBLE,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_CHAR16,
/// 	GDEXTENSION_METHOD_ARGUMENT_METADATA_INT_IS_CHAR32,
/// } GDExtensionClassMethodArgumentMetadata;
/// 
/// typedef void (*GDExtensionClassMethodCall)(void *method_userdata, GDExtensionClassInstancePtr p_instance, const GDExtensionConstVariantPtr *p_args, GDExtensionInt p_argument_count, GDExtensionVariantPtr r_return, GDExtensionCallError *r_error);
/// typedef void (*GDExtensionClassMethodValidatedCall)(void *method_userdata, GDExtensionClassInstancePtr p_instance, const GDExtensionConstVariantPtr *p_args, GDExtensionVariantPtr r_return);
/// typedef void (*GDExtensionClassMethodPtrCall)(void *method_userdata, GDExtensionClassInstancePtr p_instance, const GDExtensionConstTypePtr *p_args, GDExtensionTypePtr r_ret);
/// 
/// typedef struct {
/// 	GDExtensionStringNamePtr name;
/// 	void *method_userdata;
/// 	GDExtensionClassMethodCall call_func;
/// 	GDExtensionClassMethodPtrCall ptrcall_func;
/// 	uint32_t method_flags; // Bitfield of `GDExtensionClassMethodFlags`.
/// 
/// 	/* If `has_return_value` is false, `return_value_info` and `return_value_metadata` are ignored.
/// 	 *
/// 	 * @todo Consider dropping `has_return_value` and making the other two properties match `GDExtensionMethodInfo` and `GDExtensionClassVirtualMethod` for consistency in future version of this struct.
/// 	 */
/// 	GDExtensionBool has_return_value;
/// 	GDExtensionPropertyInfo *return_value_info;
/// 	GDExtensionClassMethodArgumentMetadata return_value_metadata;
/// 
/// 	/* Arguments: `arguments_info` and `arguments_metadata` are array of size `argument_count`.
/// 	 * Name and hint information for the argument can be omitted in release builds. Class name should always be present if it applies.
/// 	 *
/// 	 * @todo Consider renaming `arguments_info` to `arguments` for consistency in future version of this struct.
/// 	 */
/// 	uint32_t argument_count;
/// 	GDExtensionPropertyInfo *arguments_info;
/// 	GDExtensionClassMethodArgumentMetadata *arguments_metadata;
/// 
/// 	/* Default arguments: `default_arguments` is an array of size `default_argument_count`. */
/// 	uint32_t default_argument_count;
/// 	GDExtensionVariantPtr *default_arguments;
/// } GDExtensionClassMethodInfo;
/// 
/// typedef struct {
/// 	GDExtensionStringNamePtr name;
/// 	uint32_t method_flags; // Bitfield of `GDExtensionClassMethodFlags`.
/// 
/// 	GDExtensionPropertyInfo return_value;
/// 	GDExtensionClassMethodArgumentMetadata return_value_metadata;
/// 
/// 	uint32_t argument_count;
/// 	GDExtensionPropertyInfo *arguments;
/// 	GDExtensionClassMethodArgumentMetadata *arguments_metadata;
/// } GDExtensionClassVirtualMethodInfo;
/// 
/// typedef void (*GDExtensionCallableCustomCall)(void *callable_userdata, const GDExtensionConstVariantPtr *p_args, GDExtensionInt p_argument_count, GDExtensionVariantPtr r_return, GDExtensionCallError *r_error);
/// typedef GDExtensionBool (*GDExtensionCallableCustomIsValid)(void *callable_userdata);
/// typedef void (*GDExtensionCallableCustomFree)(void *callable_userdata);
/// 
/// typedef uint32_t (*GDExtensionCallableCustomHash)(void *callable_userdata);
/// typedef GDExtensionBool (*GDExtensionCallableCustomEqual)(void *callable_userdata_a, void *callable_userdata_b);
/// typedef GDExtensionBool (*GDExtensionCallableCustomLessThan)(void *callable_userdata_a, void *callable_userdata_b);
/// 
/// typedef void (*GDExtensionCallableCustomToString)(void *callable_userdata, GDExtensionBool *r_is_valid, GDExtensionStringPtr r_out);
/// 
/// typedef GDExtensionInt (*GDExtensionCallableCustomGetArgumentCount)(void *callable_userdata, GDExtensionBool *r_is_valid);
/// 
/// typedef struct {
/// 	/* Only `call_func` and `token` are strictly required, however, `object_id` should be passed if its not a static method.
/// 	 *
/// 	 * `token` should point to an address that uniquely identifies the GDExtension (for example, the
/// 	 * `GDExtensionClassLibraryPtr` passed to the entry symbol function.
/// 	 *
/// 	 * `hash_func`, `equal_func`, and `less_than_func` are optional. If not provided both `call_func` and
/// 	 * `callable_userdata` together are used as the identity of the callable for hashing and comparison purposes.
/// 	 *
/// 	 * The hash returned by `hash_func` is cached, `hash_func` will not be called more than once per callable.
/// 	 *
/// 	 * `is_valid_func` is necessary if the validity of the callable can change before destruction.
/// 	 *
/// 	 * `free_func` is necessary if `callable_userdata` needs to be cleaned up when the callable is freed.
/// 	 */
/// 	void *callable_userdata;
/// 	void *token;
/// 
/// 	GDObjectInstanceID object_id;
/// 
/// 	GDExtensionCallableCustomCall call_func;
/// 	GDExtensionCallableCustomIsValid is_valid_func;
/// 	GDExtensionCallableCustomFree free_func;
/// 
/// 	GDExtensionCallableCustomHash hash_func;
/// 	GDExtensionCallableCustomEqual equal_func;
/// 	GDExtensionCallableCustomLessThan less_than_func;
/// 
/// 	GDExtensionCallableCustomToString to_string_func;
/// } GDExtensionCallableCustomInfo; // Deprecated. Use GDExtensionCallableCustomInfo2 instead.
/// 
/// typedef struct {
/// 	/* Only `call_func` and `token` are strictly required, however, `object_id` should be passed if its not a static method.
/// 	 *
/// 	 * `token` should point to an address that uniquely identifies the GDExtension (for example, the
/// 	 * `GDExtensionClassLibraryPtr` passed to the entry symbol function.
/// 	 *
/// 	 * `hash_func`, `equal_func`, and `less_than_func` are optional. If not provided both `call_func` and
/// 	 * `callable_userdata` together are used as the identity of the callable for hashing and comparison purposes.
/// 	 *
/// 	 * The hash returned by `hash_func` is cached, `hash_func` will not be called more than once per callable.
/// 	 *
/// 	 * `is_valid_func` is necessary if the validity of the callable can change before destruction.
/// 	 *
/// 	 * `free_func` is necessary if `callable_userdata` needs to be cleaned up when the callable is freed.
/// 	 */
/// 	void *callable_userdata;
/// 	void *token;
/// 
/// 	GDObjectInstanceID object_id;
/// 
/// 	GDExtensionCallableCustomCall call_func;
/// 	GDExtensionCallableCustomIsValid is_valid_func;
/// 	GDExtensionCallableCustomFree free_func;
/// 
/// 	GDExtensionCallableCustomHash hash_func;
/// 	GDExtensionCallableCustomEqual equal_func;
/// 	GDExtensionCallableCustomLessThan less_than_func;
/// 
/// 	GDExtensionCallableCustomToString to_string_func;
/// 
/// 	GDExtensionCallableCustomGetArgumentCount get_argument_count_func;
/// } GDExtensionCallableCustomInfo2;
/// 
/// /* SCRIPT INSTANCE EXTENSION */
/// 
/// typedef void *GDExtensionScriptInstanceDataPtr; // Pointer to custom ScriptInstance native implementation.
/// 
/// typedef GDExtensionBool (*GDExtensionScriptInstanceSet)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value);
/// typedef GDExtensionBool (*GDExtensionScriptInstanceGet)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
/// typedef const GDExtensionPropertyInfo *(*GDExtensionScriptInstanceGetPropertyList)(GDExtensionScriptInstanceDataPtr p_instance, uint32_t *r_count);
/// typedef void (*GDExtensionScriptInstanceFreePropertyList)(GDExtensionScriptInstanceDataPtr p_instance, const GDExtensionPropertyInfo *p_list); // Deprecated. Use GDExtensionScriptInstanceFreePropertyList2 instead.
/// typedef void (*GDExtensionScriptInstanceFreePropertyList2)(GDExtensionScriptInstanceDataPtr p_instance, const GDExtensionPropertyInfo *p_list, uint32_t p_count);
/// typedef GDExtensionBool (*GDExtensionScriptInstanceGetClassCategory)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionPropertyInfo *p_class_category);
/// 
/// typedef GDExtensionVariantType (*GDExtensionScriptInstanceGetPropertyType)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionBool *r_is_valid);
/// typedef GDExtensionBool (*GDExtensionScriptInstanceValidateProperty)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionPropertyInfo *p_property);
/// 
/// typedef GDExtensionBool (*GDExtensionScriptInstancePropertyCanRevert)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name);
/// typedef GDExtensionBool (*GDExtensionScriptInstancePropertyGetRevert)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionVariantPtr r_ret);
/// 
/// typedef GDExtensionObjectPtr (*GDExtensionScriptInstanceGetOwner)(GDExtensionScriptInstanceDataPtr p_instance);
/// typedef void (*GDExtensionScriptInstancePropertyStateAdd)(GDExtensionConstStringNamePtr p_name, GDExtensionConstVariantPtr p_value, void *p_userdata);
/// typedef void (*GDExtensionScriptInstanceGetPropertyState)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionScriptInstancePropertyStateAdd p_add_func, void *p_userdata);
/// 
/// typedef const GDExtensionMethodInfo *(*GDExtensionScriptInstanceGetMethodList)(GDExtensionScriptInstanceDataPtr p_instance, uint32_t *r_count);
/// typedef void (*GDExtensionScriptInstanceFreeMethodList)(GDExtensionScriptInstanceDataPtr p_instance, const GDExtensionMethodInfo *p_list); // Deprecated. Use GDExtensionScriptInstanceFreeMethodList2 instead.
/// typedef void (*GDExtensionScriptInstanceFreeMethodList2)(GDExtensionScriptInstanceDataPtr p_instance, const GDExtensionMethodInfo *p_list, uint32_t p_count);
/// 
/// typedef GDExtensionBool (*GDExtensionScriptInstanceHasMethod)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name);
/// 
/// typedef GDExtensionInt (*GDExtensionScriptInstanceGetMethodArgumentCount)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionConstStringNamePtr p_name, GDExtensionBool *r_is_valid);
/// 
/// typedef void (*GDExtensionScriptInstanceCall)(GDExtensionScriptInstanceDataPtr p_self, GDExtensionConstStringNamePtr p_method, const GDExtensionConstVariantPtr *p_args, GDExtensionInt p_argument_count, GDExtensionVariantPtr r_return, GDExtensionCallError *r_error);
/// typedef void (*GDExtensionScriptInstanceNotification)(GDExtensionScriptInstanceDataPtr p_instance, int32_t p_what); // Deprecated. Use GDExtensionScriptInstanceNotification2 instead.
/// typedef void (*GDExtensionScriptInstanceNotification2)(GDExtensionScriptInstanceDataPtr p_instance, int32_t p_what, GDExtensionBool p_reversed);
/// typedef void (*GDExtensionScriptInstanceToString)(GDExtensionScriptInstanceDataPtr p_instance, GDExtensionBool *r_is_valid, GDExtensionStringPtr r_out);
/// 
/// typedef void (*GDExtensionScriptInstanceRefCountIncremented)(GDExtensionScriptInstanceDataPtr p_instance);
/// typedef GDExtensionBool (*GDExtensionScriptInstanceRefCountDecremented)(GDExtensionScriptInstanceDataPtr p_instance);
/// 
/// typedef GDExtensionObjectPtr (*GDExtensionScriptInstanceGetScript)(GDExtensionScriptInstanceDataPtr p_instance);
/// typedef GDExtensionBool (*GDExtensionScriptInstanceIsPlaceholder)(GDExtensionScriptInstanceDataPtr p_instance);
/// 
/// typedef void *GDExtensionScriptLanguagePtr;
/// 
/// typedef GDExtensionScriptLanguagePtr (*GDExtensionScriptInstanceGetLanguage)(GDExtensionScriptInstanceDataPtr p_instance);
/// 
/// typedef void (*GDExtensionScriptInstanceFree)(GDExtensionScriptInstanceDataPtr p_instance);
/// 
/// typedef void *GDExtensionScriptInstancePtr; // Pointer to ScriptInstance.
/// 
/// typedef struct {
/// 	GDExtensionScriptInstanceSet set_func;
/// 	GDExtensionScriptInstanceGet get_func;
/// 	GDExtensionScriptInstanceGetPropertyList get_property_list_func;
/// 	GDExtensionScriptInstanceFreePropertyList free_property_list_func;
/// 
/// 	GDExtensionScriptInstancePropertyCanRevert property_can_revert_func;
/// 	GDExtensionScriptInstancePropertyGetRevert property_get_revert_func;
/// 
/// 	GDExtensionScriptInstanceGetOwner get_owner_func;
/// 	GDExtensionScriptInstanceGetPropertyState get_property_state_func;
/// 
/// 	GDExtensionScriptInstanceGetMethodList get_method_list_func;
/// 	GDExtensionScriptInstanceFreeMethodList free_method_list_func;
/// 	GDExtensionScriptInstanceGetPropertyType get_property_type_func;
/// 
/// 	GDExtensionScriptInstanceHasMethod has_method_func;
/// 
/// 	GDExtensionScriptInstanceCall call_func;
/// 	GDExtensionScriptInstanceNotification notification_func;
/// 
/// 	GDExtensionScriptInstanceToString to_string_func;
/// 
/// 	GDExtensionScriptInstanceRefCountIncremented refcount_incremented_func;
/// 	GDExtensionScriptInstanceRefCountDecremented refcount_decremented_func;
/// 
/// 	GDExtensionScriptInstanceGetScript get_script_func;
/// 
/// 	GDExtensionScriptInstanceIsPlaceholder is_placeholder_func;
/// 
/// 	GDExtensionScriptInstanceSet set_fallback_func;
/// 	GDExtensionScriptInstanceGet get_fallback_func;
/// 
/// 	GDExtensionScriptInstanceGetLanguage get_language_func;
/// 
/// 	GDExtensionScriptInstanceFree free_func;
/// 
/// } GDExtensionScriptInstanceInfo; // Deprecated. Use GDExtensionScriptInstanceInfo3 instead.
/// 
/// typedef struct {
/// 	GDExtensionScriptInstanceSet set_func;
/// 	GDExtensionScriptInstanceGet get_func;
/// 	GDExtensionScriptInstanceGetPropertyList get_property_list_func;
/// 	GDExtensionScriptInstanceFreePropertyList free_property_list_func;
/// 	GDExtensionScriptInstanceGetClassCategory get_class_category_func; // Optional. Set to NULL for the default behavior.
/// 
/// 	GDExtensionScriptInstancePropertyCanRevert property_can_revert_func;
/// 	GDExtensionScriptInstancePropertyGetRevert property_get_revert_func;
/// 
/// 	GDExtensionScriptInstanceGetOwner get_owner_func;
/// 	GDExtensionScriptInstanceGetPropertyState get_property_state_func;
/// 
/// 	GDExtensionScriptInstanceGetMethodList get_method_list_func;
/// 	GDExtensionScriptInstanceFreeMethodList free_method_list_func;
/// 	GDExtensionScriptInstanceGetPropertyType get_property_type_func;
/// 	GDExtensionScriptInstanceValidateProperty validate_property_func;
/// 
/// 	GDExtensionScriptInstanceHasMethod has_method_func;
/// 
/// 	GDExtensionScriptInstanceCall call_func;
/// 	GDExtensionScriptInstanceNotification2 notification_func;
/// 
/// 	GDExtensionScriptInstanceToString to_string_func;
/// 
/// 	GDExtensionScriptInstanceRefCountIncremented refcount_incremented_func;
/// 	GDExtensionScriptInstanceRefCountDecremented refcount_decremented_func;
/// 
/// 	GDExtensionScriptInstanceGetScript get_script_func;
/// 
/// 	GDExtensionScriptInstanceIsPlaceholder is_placeholder_func;
/// 
/// 	GDExtensionScriptInstanceSet set_fallback_func;
/// 	GDExtensionScriptInstanceGet get_fallback_func;
/// 
/// 	GDExtensionScriptInstanceGetLanguage get_language_func;
/// 
/// 	GDExtensionScriptInstanceFree free_func;
/// 
/// } GDExtensionScriptInstanceInfo2; // Deprecated. Use GDExtensionScriptInstanceInfo3 instead.
/// 
/// typedef struct {
/// 	GDExtensionScriptInstanceSet set_func;
/// 	GDExtensionScriptInstanceGet get_func;
/// 	GDExtensionScriptInstanceGetPropertyList get_property_list_func;
/// 	GDExtensionScriptInstanceFreePropertyList2 free_property_list_func;
/// 	GDExtensionScriptInstanceGetClassCategory get_class_category_func; // Optional. Set to NULL for the default behavior.
/// 
/// 	GDExtensionScriptInstancePropertyCanRevert property_can_revert_func;
/// 	GDExtensionScriptInstancePropertyGetRevert property_get_revert_func;
/// 
/// 	GDExtensionScriptInstanceGetOwner get_owner_func;
/// 	GDExtensionScriptInstanceGetPropertyState get_property_state_func;
/// 
/// 	GDExtensionScriptInstanceGetMethodList get_method_list_func;
/// 	GDExtensionScriptInstanceFreeMethodList2 free_method_list_func;
/// 	GDExtensionScriptInstanceGetPropertyType get_property_type_func;
/// 	GDExtensionScriptInstanceValidateProperty validate_property_func;
/// 
/// 	GDExtensionScriptInstanceHasMethod has_method_func;
/// 
/// 	GDExtensionScriptInstanceGetMethodArgumentCount get_method_argument_count_func;
/// 
/// 	GDExtensionScriptInstanceCall call_func;
/// 	GDExtensionScriptInstanceNotification2 notification_func;
/// 
/// 	GDExtensionScriptInstanceToString to_string_func;
/// 
/// 	GDExtensionScriptInstanceRefCountIncremented refcount_incremented_func;
/// 	GDExtensionScriptInstanceRefCountDecremented refcount_decremented_func;
/// 
/// 	GDExtensionScriptInstanceGetScript get_script_func;
/// 
/// 	GDExtensionScriptInstanceIsPlaceholder is_placeholder_func;
/// 
/// 	GDExtensionScriptInstanceSet set_fallback_func;
/// 	GDExtensionScriptInstanceGet get_fallback_func;
/// 
/// 	GDExtensionScriptInstanceGetLanguage get_language_func;
/// 
/// 	GDExtensionScriptInstanceFree free_func;
/// 
/// } GDExtensionScriptInstanceInfo3;
/// 
/// /* INITIALIZATION */
/// 
/// typedef enum {
/// 	GDEXTENSION_INITIALIZATION_CORE,
/// 	GDEXTENSION_INITIALIZATION_SERVERS,
/// 	GDEXTENSION_INITIALIZATION_SCENE,
/// 	GDEXTENSION_INITIALIZATION_EDITOR,
/// 	GDEXTENSION_MAX_INITIALIZATION_LEVEL,
/// } GDExtensionInitializationLevel;
/// 
/// typedef struct {
/// 	/* Minimum initialization level required.
/// 	 * If Core or Servers, the extension needs editor or game restart to take effect */
/// 	GDExtensionInitializationLevel minimum_initialization_level;
/// 	/* Up to the user to supply when initializing */
/// 	void *userdata;
/// 	/* This function will be called multiple times for each initialization level. */
/// 	void (*initialize)(void *userdata, GDExtensionInitializationLevel p_level);
/// 	void (*deinitialize)(void *userdata, GDExtensionInitializationLevel p_level);
/// } GDExtensionInitialization;
/// 
/// typedef void (*GDExtensionInterfaceFunctionPtr)();
/// typedef GDExtensionInterfaceFunctionPtr (*GDExtensionInterfaceGetProcAddress)(const char *p_function_name);
/// 
