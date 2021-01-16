let ctx = Z3.mk_context [("model", "true")]

let bv_size = 64

let ptr_mask = 0x80_00_00__00_00_00_00_00L

let refinement_mask = 0x7f_ff_ff__00_00_00_00_00L

let ncores = 8

let chunksize = 1

(* let rules_to_split =
  [ "GetStaticMethodID";
    "GetStaticFieldID";
    "GetMethodID";
    "GetFieldID";
    "CallNonvirtualDoubleMethodV";
    "CallNonvirtualFloatMethodV";
    "CallNonvirtualLongMethodV";
    "CallNonvirtualIntMethodV";
    "CallNonvirtualShortMethodV";
    "CallNonvirtualCharMethodV";
    "CallNonvirtualByteMethodV";
    "CallNonvirtualObjectMethodV";
    "CallNonvirtualVoidMethodV";
    "CallNonvirtualBooleanMethodV";
    "CallNonvirtualDoubleMethodA";
    "CallNonvirtualFloatMethodA";
    "CallNonvirtualLongMethodA";
    "CallNonvirtualIntMethodA";
    "CallNonvirtualShortMethodA";
    "CallNonvirtualCharMethodA";
    "CallNonvirtualByteMethodA";
    "CallNonvirtualObjectMethodA";
    "CallNonvirtualVoidMethodA";
    "CallNonvirtualBooleanMethodA";
    "CallNonvirtualDoubleMethod";
    "CallNonvirtualFloatMethod";
    "CallNonvirtualLongMethod";
    "CallNonvirtualIntMethod";
    "CallNonvirtualShortMethod";
    "CallNonvirtualCharMethod";
    "CallNonvirtualByteMethod";
    "CallNonvirtualObjectMethod";
    "CallNonvirtualVoidMethod";
    "CallNonvirtualBooleanMethod";
    "DefineClass";
    "F1"; "F2"; "F3" ] *)
