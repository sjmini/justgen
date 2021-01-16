#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include "HelloJNI.h"
#include <stdarg.h>
#include <assert.h>

#define JNI_Output_jint(input,env) printf("Result:%d\n",input)
#define JNI_Output_jchar(input,env) printf("Result:%x\n", input)
#define JNI_Output_jchar_ptr(input,env) printf("Result_Pointer:%x\n", (*(jchar*)input))
#define JNI_Output_jchar_const_ptr(input,env) printf("Result_Pointer:%x\n", (*(jchar*)input))

#define JNI_Output_jboolean(input,env) printf("Result:%d\n", input)
#define JNI_Output_jbyte(input,env) printf("Result:%x\n", input)
#define JNI_Output_jshort(input,env) printf("Result:%d\n", input)

#define JNI_Output_jlong(input,env) printf("Result:%ld\n", input)
#define JNI_Output_jfloat(input,env) printf("Result:%f\n", input)
#define JNI_Output_jdouble(input,env) printf("Result:%f\n", input)
#define JNI_Output_jstring(input,env) printf("Result:%x\n", ((char*)(*env)->GetStringUTFChars(env, (jstring)input, 0)))

#define JNI_Output_char(input,env) printf("Result:%x\n", input)
#define JNI_Output_const_char_ptr(input,env) printf("Result_Pointer:%x\n",(*(char*)input))
#define JNI_Output_default(input,env) printf("Result:None%x\n", input)

#define JNI_Output(input,env) \
       _Generic(input, \
       jint: JNI_Output_jint(input,env), \
       jchar: JNI_Output_jchar(input,env), \
       jboolean: JNI_Output_jboolean(input,env), \
       jbyte: JNI_Output_jbyte(input,env), \
       jshort: JNI_Output_jshort(input,env), \
       jlong: JNI_Output_jlong(input,env), \
       jfloat: JNI_Output_jfloat(input,env), \
       jdouble: JNI_Output_jdouble(input,env), \
       char: JNI_Output_char(input,env), \
       jchar*: JNI_Output_jchar_ptr((int)input,env), \
       const jchar *: JNI_Output_jchar_const_ptr((int)input,env), \
       jstring: JNI_Output_jstring((int)input,env), \
       const char *: JNI_Output_const_char_ptr((int)input,env), \
       default: JNI_Output_default(input,env))

/*
#define JNI_Output(input,env) \
       _Generic(input, \
       jint: JNI_Output_jint(input,env), \
       jchar: JNI_Output_jchar(input,env), \
       jboolean: JNI_Output_jboolean(input,env), \
       jbyte: JNI_Output_jbyte(input,env), \
       jshort: JNI_Output_jshort(input,env), \
       jlong: JNI_Output_jlong(input,env), \
       jfloat: JNI_Output_float(input,env), \
       jdouble: JNI_Output_jdouble(input,env), \
       char: JNI_Output_char(input,env), \
       default: JNI_Output_default(input,env))


#define JNI_Output_PTR(input,env) \
        _Generic(input, \
       jchar*: JNI_Output_jchar_ptr(input,env), \
       const jchar *: JNI_Output_jchar_const_ptr(input,env), \
       jstring: JNI_Output_jstring(input,env), \
       const char *: JNI_Output_const_char_ptr(input,env), \
       default: JNI_Output_default(input,env))
*/
const char *const TYPE_NAME[] = {"Object", "Boolean", "Byte", "Char", "Short", "Int", "Long", "Float", "Double", "Void"};
const char *const TYPE_SIG[] = {"Ljava/lang/Object;", "Z", "B", "C", "S", "I", "J", "F", "D", "V"};
const char *const CLASS1_CLASS_PATH = "Class1.class";
const int ARRAY_SIZE = 10;
const int JNI_ABORTJI = 2;
const int JNI_COMMITJI = 1;

jcharArray jcharArrayGlobal;
jbyteArray jbyteArrayGlobal;
jdoubleArray jdoubleArrayGlobal; 
jfloatArray jfloatArrayGlobal;
jintArray jintArrayGlobal;
jlongArray jlongArrayGlobal;
jshortArray jshortArrayGlobal;
jbooleanArray jbooleanArrayGlobal;

jboolean *jbooleanPtrGlobal;

bool contains(const char *haystack, const char *needle) {
    return strstr(haystack, needle) != NULL;
}

bool starts_ends_with(const char *string, const char *start, const char *end) {
    char *ptr;
    ptr = strstr(string, start);
    if (ptr == NULL || ptr != string) {
        return false;
    }
    ptr = strstr(string, end);
    if (ptr == NULL || ptr + strlen(end) != string + strlen(string)) {
        return false;
    }
    return true;
}

int get_type_index(const char *refinement) {
    char *type_predicate = calloc(20, sizeof(char));

    int i;
    for (i=0; i<10; i++) {
        strcat(type_predicate, (i != 9)? "@isJ" : "@is");
        strcat(type_predicate, TYPE_NAME[i]);
        if (contains(refinement, type_predicate)) {
            free(type_predicate);
            return i;
        }
        type_predicate[0] = '\0';
    }

    free(type_predicate);
    assert(false && "JNI_Test_Gen_Fail");
    return -1;
}


char *leaf_char_PTR_RisClassSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    if (strcmp(refinement, "@isArrayCL@isContainMethod@isObjectCL@!isNULLCL@!isThrowableCL") == 0) {
        return "[Ljava/lang/Object;";
    }
    else if (strcmp(refinement, "@isArrayCL@isContainMethod@isThrowableCL@!isNULLCL@!isObjectCL") == 0) {
        return "[Ljava/lang/Throwable;";
    }
    else if (strcmp(refinement, "@isArrayCL@isContainMethod@!isNULLCL@!isObjectCL@!isThrowableCL") == 0) {
        return "[Ljava/lang/Number;";
    }
    else if (strcmp(refinement, "@isArrayCL@isObjectCL@!isContainMethod@!isNULLCL@!isThrowableCL") == 0) {
        return "[Ljava/lang/Object;";
    }
    else if (strcmp(refinement, "@isArrayCL@isThrowableCL@!isContainMethod@!isNULLCL@!isObjectCL") == 0) {
        return "[Ljava/lang/Throwable;";
    }
    else if (strcmp(refinement, "@isArrayCL@!isContainMethod@!isNULLCL@!isObjectCL@!isThrowableCL") == 0) {
        return "[Ljava/lang/Boolean;";
    }
    else if (strcmp(refinement, "@isContainMethod@isObjectCL@!isArrayCL@!isNULLCL@!isThrowableCL") == 0) {
        return "java/lang/Object";
    }
    else if (strcmp(refinement, "@isContainMethod@isThrowableCL@!isArrayCL@!isNULLCL@!isObjectCL") == 0) {
        return "java/lang/Throwable";
    }
    else if (strcmp(refinement, "@isContainMethod@!isArrayCL@!isNULLCL@!isObjectCL@!isThrowableCL") == 0) {
        return "java/lang/Number";
    }
    else if (strcmp(refinement, "@isNULLCL@!isArrayCL@!isContainMethod@!isObjectCL@!isThrowableCL") == 0) {
        return "non/existent/Class";
    }
    else if (strcmp(refinement, "@isObjectCL@!isArrayCL@!isContainMethod@!isNULLCL@!isThrowableCL") == 0) {
        return "java/lang/Object";
    }
    else if (strcmp(refinement, "@isThrowableCL@!isArrayCL@!isContainMethod@!isNULLCL@!isObjectCL") == 0) {
        return "java/lang/Throwable";
    }
    else if (strcmp(refinement, "@!isArrayCL@!isContainMethod@!isNULLCL@!isObjectCL@!isThrowableCL") == 0) {
        return "java/lang/Boolean";
    }
    else {
        assert(false && "JNI_Test_Gen_Fail");
        exit(EXIT_FAILURE);
    }
}

jint leaf_Dot(JNIEnv *env, const char *used_in, const char *refinement) {
    return 0;
}

char *leaf_char_PTR_RisEndWithZC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)Z";
}

char *leaf_char_PTR_RisUTF8C(JNIEnv *env, const char *used_in, const char *refinement) {
    if (strcmp(used_in, "GetMethodID") == 0) {
      if(strcmp(refinement,"")==0){
         return "publicIntMethod1";
      }
      else{
         bool isPrivateM = contains(refinement, "@isPrivateM");
         int type_index = get_type_index(refinement);

         char *name = calloc(100, sizeof(char));
         strcat(name, isPrivateM? "private" : "public");
         strcat(name, TYPE_NAME[type_index]);
         strcat(name, "Method1");
         return name;
      }
    }
    else if (strcmp(used_in, "NewStringUTF") == 0) {
        return "a string";
    }
    else if (strcmp(used_in, "DefineClass") == 0) {
        return "Class1";
    }
    else {
        assert(false && "JNI_Test_Gen_Fail");
        exit(EXIT_FAILURE);
    }
}

jclass leaf_jclass_RisContainMethod(JNIEnv *env, const char *used_in, const char *refinement) {
    if (contains(refinement, "@!isInThisClassM")) {
        jclass class1 = (*env)->FindClass(env, "Class2");
        assert(class1 != NULL && "JNI_Test_Gen_Fail");
        return class1;
    }
    else {
        jclass class1 = (*env)->FindClass(env, "Class1");
        assert(class1 != NULL && "JNI_Test_Gen_Fail");
        return class1;
    }
}

jarray leaf_jarray(JNIEnv *env, const char *used_in, const char *refinement) {
    jintArray res = (*env)->NewIntArray(env, ARRAY_SIZE);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res; 
}

void *leaf_NULL(JNIEnv *env, const char *used_in, const char *refinement) {
    return NULL;
}

jsize leaf_jsize(JNIEnv *env, const char *used_in, const char *refinement) {
    if (starts_ends_with(used_in, "New", "Array") || strcmp(used_in, "NewString") == 0) {
        // NewXxxArray, NewString
        return ARRAY_SIZE;
    }
    else if (strcmp(used_in, "DefineClass") == 0) {
        int buf_len = 0;

        FILE *fp = fopen(CLASS1_CLASS_PATH, "r");
        assert(fp != NULL && "JNI_Test_Gen_Fail");
        while (fgetc(fp) != EOF) {
            buf_len++;
        }
        fclose(fp);
        assert(buf_len > 0 && "JNI_Test_Gen_Fail");
        return buf_len;
    }
    else if (starts_ends_with(used_in, "Get", "ArrayRegion") || starts_ends_with(used_in, "Set", "ArrayRegion")) {
        // GetXxxArrayRegion, SetXxxArrayRegion
        return 0;
    }
    else if(strcmp(used_in, "GetStringRegion") == 0){
        return 1;
    }
    else if(strcmp(used_in, "GetStringUTFRegion") == 0){
          return 1;
    }
    else {
        assert(false && "JNI_Test_Gen_Fail");
        exit(EXIT_FAILURE);
    }
}

char *leaf_char_PTR_RisEndWithVC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    if (contains(refinement, "@isInitM") && contains(refinement, "@isPrivateM")) {
        return "(D)V";
    }
    else {
        return "(I)V";
    }
}

char *leaf_char_PTR_RisInitC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "<init>";
}

jmethodID leaf_jmethodID_RisInitM(JNIEnv *env, const char *used_in, const char *refinement) {
    if (contains(refinement, "@isLoaderO")) {
        jclass class1 = (*env)->FindClass(env, "java/security/SecureClassLoader");
        assert(class1 != NULL);
        jmethodID result = (*env)->GetMethodID(env, class1, "<init>", "()V");
        assert(result != NULL && "JNI_Test_Gen_Fail");
        return result;
    }
    else {
        jclass class1 = (*env)->FindClass(env, "Class1");
        jmethodID result = (*env)->GetMethodID(env, class1, "<init>", "(I)V");
        assert(result != NULL && "JNI_Test_Gen_Fail");
        return result;
    }
}

jclass leaf_jclass_RNot_isArrayCL(JNIEnv *env, const char *used_in, const char *refinement) {
    if (contains(refinement, "@isLoaderO")) {
        jclass class1 = (*env)->FindClass(env, "java/security/SecureClassLoader");
        assert(class1 != NULL && "JNI_Test_Gen_Fail");
        return class1;
    }
    else {
        jclass class1 = (*env)->FindClass(env, "Class1");
        assert(class1 != NULL && "JNI_Test_Gen_Fail");
        return class1;
    }
}

char *leaf_char_PTR_RisMethodNameC(JNIEnv *env, const char *used_in, const char *refinement) {
    if(strcmp(refinement,"")==0){
        return "publicStaticBooleanMethod1";
    }  
    else{
       bool isPrivateM = contains(refinement, "@isPrivateM");
       int type_index = get_type_index(refinement);

       char *name = calloc(100, sizeof(char));
       strcat(name, isPrivateM? "private" : "public");
       strcat(name, "Static");
       strcat(name, TYPE_NAME[type_index]);
       strcat(name, "Method1");
       return name;
    }
}

jclass leaf_jclass(JNIEnv *env, const char *used_in, const char *refinement) {
    if (contains(refinement, "@!isInThisClassM")) {
        jclass clz1 = (*env)->FindClass(env, "Class2");
        assert(clz1 != NULL && "JNI_Test_Gen_Fail");
        return clz1;
    }
    else {
        jclass clz1 = (*env)->FindClass(env, "Class1");
        assert(clz1 != NULL && "JNI_Test_Gen_Fail");
        return clz1;
    }
}

char *leaf_char_PTR_RisEndWithBC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)B";
}

char *leaf_char_PTR_RisEndWithCC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)C";
}

char *leaf_char_PTR_RisEndWithDC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)D";
}

char *leaf_char_PTR_RisEndWithFC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)F";
}

char *leaf_char_PTR_RisEndWithIC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)I";
}

char *leaf_char_PTR_RisEndWithJC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)J";
}

char *leaf_char_PTR_RisEndWithLC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)Ljava/lang/Object;";
}

char *leaf_char_PTR_RisEndWithSC_RisMethodSigC(JNIEnv *env, const char *used_in, const char *refinement) {
    return "(I)S";
}

jthrowable leaf_jthrowable_RNot_isNULLT(JNIEnv *env, const char *used_in, const char *refinement) {
    jclass clazz = (*env)->FindClass(env, "java/lang/Throwable");
    assert(clazz != NULL && "JNI_Test_Gen_Fail");
    
    jmethodID methodID = (*env)->GetMethodID(env, clazz, "<init>", "()V");
    assert(methodID != NULL && "JNI_Test_Gen_Fail");

    jthrowable res = (*env)->NewObject(env, clazz, methodID);
    assert(((*env)->IsInstanceOf(env, res, clazz)) && "JNI_Test_Gen_Fail");
    return res;
}
/*
jthrowable leaf_jthrowable_RNot_isNULLT_RNot_isThrowableT(JNIEnv *env, const char *used_in, const char *refinement) {
    jclass clazz = (*env)->FindClass(env, "java/lang/Object");
    jmethodID methodID = (*env)->GetMethodID(env, clazz, "<init>", "()V");
    return (*env)->NewObject(env, clazz, methodID); // correct?
}
*/
jvalue *leaf_jvalue_PTR_RisArrayPtrJV(JNIEnv *env, const char *used_in, const char *refinement) {
    jvalue *arr = calloc(1, sizeof(jvalue));
    arr[0].i = 0;
    return arr;
}
/*
jvalue *leaf_jvalue_PTR_RNot_isArrayPtrJV(JNIEnv *env, const char *used_in, const char *refinement) {
    return NULL; // correct?
}
*/
// va_list leaf_va_list(JNIEnv *env, const char *used_in, const char *refinement) {
// }

int leaf_va_list(JNIEnv *env, const char *used_in, const char *refinement) {
  return 1;
}


jbyte *leaf_jbyte_PTR_RisBytePointerClassInfo(JNIEnv *env, const char *used_in, const char *refinement) {
    int capacity = 100;
    jbyte *buf = malloc(capacity * sizeof(jbyte));
    FILE *fp = fopen(CLASS1_CLASS_PATH, "r");
    assert(fp != NULL && "JNI_Test_Gen_Fail");

    int byte;
    int index = 0;
    while ((byte = fgetc(fp)) != EOF) {
        if (index >= capacity) {
            capacity *= 2;
            buf = realloc(buf, capacity * sizeof(jbyte));
        }

        buf[index] = byte;

        index++;
    }
    assert((index > 0) && (buf != NULL) && "JNI_Test_Gen_Fail");
    fclose(fp);
    return buf;
}


void call_CallLongMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jlong res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallLongMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%ld\n", res);
}

void call_CallBooleanMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jboolean res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallBooleanMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallByteMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jbyte res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallByteMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallCharMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jchar res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallCharMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallDoubleMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jdouble res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallDoubleMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallFloatMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jfloat res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallFloatMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallIntMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jint res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallIntMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallShortMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jshort res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallShortMethodV(env, obj, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallVoidMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  (*env)->CallVoidMethodV(env, obj, mid, ap);
  va_end(ap);
  //printf("Result: done\n");
}

void call_CallObjectMethodV(JNIEnv *env, jobject obj, jmethodID mid, ...){
  va_list ap;
  jobject res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallObjectMethodV(env, obj, mid, ap);
  va_end(ap);
 // printf("Result: %d\n", res); //need to check this. How can we compare the result? jobject can be varied.
}

void call_CallNonvirtualBooleanMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jboolean res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualBooleanMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallNonvirtualByteMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jbyte res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualByteMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallNonvirtualCharMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jchar res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualCharMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallNonvirtualDoubleMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jdouble res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualDoubleMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallNonvirtualFloatMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jfloat res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualFloatMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallNonvirtualIntMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jint res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualIntMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallNonvirtualLongMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jlong res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualLongMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%ld\n", res);
}

void call_CallNonvirtualObjectMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jobject res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualObjectMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  //printf("Result: %d\n", res);
}

void call_CallNonvirtualShortMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jshort res;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallNonvirtualShortMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallNonvirtualVoidMethodV(JNIEnv *env, jobject obj, jclass clazz, jmethodID mid, ...){
  va_list ap;
  va_start(ap,mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  (*env)->CallNonvirtualVoidMethodV(env, obj, clazz, mid, ap);
  va_end(ap);
  //printf("Result: done\n");
}

void call_CallStaticLongMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jlong res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticLongMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%ld\n", res);
}

void call_CallStaticBooleanMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jboolean res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticBooleanMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallStaticByteMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jbyte res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticByteMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallStaticCharMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jchar res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticCharMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%x\n", res);
}

void call_CallStaticDoubleMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jdouble res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticDoubleMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallStaticFloatMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jfloat res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticFloatMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%f\n", res);
}

void call_CallStaticIntMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jint res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticIntMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallStaticShortMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jshort res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticShortMethodV(env, clazz, mid, ap);
  va_end(ap);
  printf("Result:%d\n", res);
}

void call_CallStaticVoidMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  (*env)->CallStaticVoidMethodV(env, clazz, mid, ap);
  va_end(ap);
  //printf("Result: done\n");
}

void call_CallStaticObjectMethodV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jobject res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->CallStaticObjectMethodV(env, clazz, mid, ap);
  va_end(ap);
  //printf("Result: %d\n", res); //need to check this. How can we compare the result? jobject can be varied.
}

void call_NewObjectV(JNIEnv *env, jclass clazz, jmethodID mid, ...){
  va_list ap;
  jobject res;
  va_start(ap, mid);
  jthrowable exc = (*env)->ExceptionOccurred(env);
  assert(exc == NULL && "JNI_Test_Gen_Fail");
  printf("Testing_EAN_JNI: ");
  fflush(stdout);
  res = (*env)->NewObjectV(env, clazz, mid, ap);
  va_end(ap);
  //printf("Result: %d\n", res); //need to check this. How can we compare the result? jobject can be varied.
}

/*
285815 code_gen5
"@isDeletedO@isGlobalO@isReflectConstructorO@!isLoaderO@!isLocalO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectFieldO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isReflectFieldO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectMethodO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isGlobalO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectConstructorO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@isReflectConstructorO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectFieldO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectMethodO"
"@isDeletedO@isLocalO@isReflectFieldO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectMethodO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO"
"@isDeletedO@isLocalO@isReflectMethodO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isLocalO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLoaderO@isLocalO@isSubClassO@!isGlobalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLoaderO@isLocalO@!isGlobalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectConstructorO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@isReflectConstructorO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectFieldO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectMethodO"
"@isDeletedO@isLocalO@isReflectFieldO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectMethodO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO"
"@isDeletedO@isLocalO@isReflectMethodO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isLocalO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isLoaderO@isSubClassO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectConstructorO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isReflectConstructorO@!isLoaderO@!isLocalO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectFieldO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isReflectFieldO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectMethodO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO"
"@isDeletedO@isGlobalO@isReflectMethodO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isGlobalO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isLoaderO@isSubClassO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectConstructorO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isReflectConstructorO@!isLoaderO@!isLocalO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isReflectMethodO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO"
"@isDeletedO@isGlobalO@isReflectMethodO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isGlobalO@isSubClassO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@!isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLoaderO@isLocalO@isSubClassO@!isGlobalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLoaderO@isLocalO@!isGlobalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectConstructorO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@isReflectConstructorO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isLocalO@isReflectMethodO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO"
"@isDeletedO@isLocalO@isReflectMethodO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isSubClassO"
"@isDeletedO@isLocalO@isSubClassO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isLocalO@!isGlobalO@!isLoaderO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
"@isDeletedO@isGlobalO@isLoaderO@isSubClassO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO"
"@isDeletedO@isGlobalO@isLoaderO@!isLocalO@!isNULLO@!isReflectConstructorO@!isReflectFieldO@!isReflectMethodO@!isSubClassO"
*/
jobject leaf_RisDeletedO(JNIEnv *env, const char *used_in, const char *refinement){
  jobject res_obj;
  jclass localRefCls = (*env)->FindClass(env, "java/lang/String");
  if (localRefCls == NULL) {
       //printf("Error in leaf_RisDeletedO");
       assert(false && "JNI_Test_Gen_Fail");
       return NULL; /* exception thrown */
  }

  if (contains(refinement, "@!isGlobalO")) {
    res_obj = (*env)->NewLocalRef(env, localRefCls);
    assert(res_obj != NULL && "JNI_Test_Gen_Fail");
    (*env)->DeleteLocalRef(env, res_obj);
    return res_obj;
  }
  else{
    res_obj = (*env)->NewGlobalRef(env, localRefCls);
    assert(res_obj != NULL && "JNI_Test_Gen_Fail");
    (*env)->DeleteLocalRef(env, res_obj);
    return res_obj;
  }
}
    
jobject leaf_RNot_isDeletedO(JNIEnv *env, const char *used_in, const char *refinement){
  jobject res_obj;
  jclass localRefCls = (*env)->FindClass(env, "java/lang/String");
  if (localRefCls == NULL) {
       //printf("Error in leaf_RisDeletedO");
       assert(false && "JNI_Test_Gen_Fail");
       return NULL; /* exception thrown */
  }

  if (contains(refinement, "@!isGlobalO")) {
    res_obj = (*env)->NewLocalRef(env, localRefCls);
    assert(res_obj != NULL && "JNI_Test_Gen_Fail");
    return res_obj;
  }
  else{
    res_obj = (*env)->NewGlobalRef(env, localRefCls);
    assert(res_obj != NULL && "JNI_Test_Gen_Fail");
    return res_obj;
  }
}

jint leaf_jint_RisJNI_ABORTJI_RisThisArrayLenJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isPositiveJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 2;
}

jint leaf_jint_RisJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isPositiveJI_RNot_isThisArrayLenJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 2;  
}

jint leaf_jint_RisJNI_COMMITJI_RisThisArrayLenJI_RNot_isJNI_ABORTJI_RNot_isNegativeJI_RNot_isPositiveJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 1;
}

jint leaf_jint_RisJNI_COMMITJI_RNot_isJNI_ABORTJI_RNot_isNegativeJI_RNot_isPositiveJI_RNot_isThisArrayLenJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 1;
}

//missing pre_cond. jint@isNegativeJI should not come with jint@isThisArrayLenJI
jint leaf_jint_RisNegativeJI_RisThisArrayLenJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isPositiveJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return -1; 
}

jint leaf_jint_RisNegativeJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isPositiveJI_RNot_isThisArrayLenJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
 return -5;
}

jint leaf_jint_RisThisArrayLenJI_RisZeroJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isPositiveJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 0;
}

jint leaf_jint_RisZeroJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isPositiveJI_RNot_isThisArrayLenJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 0;
}

jboolean *leaf_jboolean_PTR_RNot_isNULLJB(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jboolean));
}
/*
jstring leaf_jstring(JNIEnv *env, const char *used_in, const char *refinement){
//jstring NewStringUTF(JNIEnv *env, const char *bytes);
return (*env)->NewStringUTF(env,"HSJ");
}
*/

jstring leaf_jstring(JNIEnv *env, const char *used_in, const char *refinement){
  if (strcmp(refinement, "@isEndWithBC@isFieldNameC@isGetStringUTFCharC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldSigC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC") == 0) {
    jstring str = (*env)->NewStringUTF(env,"publicByteField1B");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithBC@isFieldSigC@isGetStringUTFCharC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env,"B");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithBC@isGetStringUTFCharC@isMethodNameC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isFieldSigC@!isInitC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "publicByteMethod1B");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithBC@isGetStringUTFCharC@isMethodSigC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isFieldSigC@!isInitC@!isMethodNameC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "(I)B");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithBC@isGetStringUTFCharC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isFieldSigC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "B");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithCC@isFieldNameC@isGetStringUTFCharC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithBC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldSigC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "publicCharField1C");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithCC@isFieldSigC@isGetStringUTFCharC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithBC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "C");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isEndWithCC@isGetStringUTFCharC@isMethodNameC@isUTF8C@!isArrayClassSigC@!isClassSigC@!isEndWithBC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isFieldSigC@!isInitC@!isMethodSigC@!isNULLC") == 0){
    jstring str = (*env)->NewStringUTF(env, "publicCharMethod1C");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (strcmp(refinement, "@isArrayClassSigC@isEndWithBC@isGetStringUTFCharC@isUTF8C@!isClassSigC@!isEndWithCC@!isEndWithDC@!isEndWithFC@!isEndWithIC@!isEndWithJC@!isEndWithLC@!isEndWithSC@!isEndWithVC@!isEndWithZC@!isFieldNameC@!isFieldSigC@!isInitC@!isMethodNameC@!isMethodSigC@!isNULLC")==0){
    jstring str = (*env)->NewStringUTF(env, "[java.lang.Byte");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }
  else if (contains(refinement, "@isArrayClassSigC")) {
    jstring str = (*env)->NewStringUTF(env, "[Class1");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (contains(refinement, "@isMethodSigC")) {
    jstring str = (*env)->NewStringUTF(env, "(I)C");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else if (contains(refinement, "@isClassSigC")) {
    jstring str = (*env)->NewStringUTF(env, "Class1");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }

  else{
    jstring str = (*env)->NewStringUTF(env, "publicCharMethod1C");
    assert(str != NULL && "JNI_Test_Gen_Fail");
    return str;
  }
}
//HERE!!!!!!!!!!!!!
char *leaf_char_PTR_RisEndWithBC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicByteField1B");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithBC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "B");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithBC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicByteMethod1B");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithBC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)B");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithBC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAB");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithCC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicCharField1C");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithCC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "C");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}


char *leaf_char_PTR_RisEndWithCC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicCharMethod1C");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithCC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)C");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithCC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAC");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithDC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicDoubleField1D");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithDC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "D");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithDC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicDoubleMethod1D");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithDC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)D");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithDC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithFC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicFloatField1F");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithFC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "F");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithFC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicFloatMethod1F");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithFC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)F");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithFC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSF");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithIC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicIntField1I");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithIC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "I");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithIC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicIntMethod1I");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithIC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)I");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithIC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "SSSSSSSSSSSSSSSSSSSSSSI");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithJC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicLongField1J");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithJC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "J");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithJC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicLongMethod1J");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithJC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)J");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithJC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "AAAAAAAAAAAAAAAAJ");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithLC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicObjectField1L");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithLC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "Ljava/lang/Object");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithLC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicObjectMethod1L");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithLC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)Ljava/lang/Object");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithLC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "SSSSL");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithSC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicShortField1S");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithSC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "S");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithSC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicShortMethod1S");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithSC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)S");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithSC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "SSSS11111111111111111111111111111111111111111111111!S");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithVC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicVoidField1V");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

//added preamble. Not possible
char *leaf_char_PTR_RisEndWithVC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   assert(false && "JNI_Test_Gen_Fail");
   jstring tmp = (*env)->NewStringUTF(env, "NotPossibleValue1234567890V");
   return (*env)->GetStringUTFChars(env, tmp, NULL);
}

char *leaf_char_PTR_RisEndWithVC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicVoidMethod1V");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisEndWithVC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)V");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithVC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "VVVVV");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithZC_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicBooleanField1Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithZC_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithZC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicBooleanMethod1Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithZC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisEndWithZC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "ANYANYANYANYNAYNAYNAYNAYNAYNAYNAYZ");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

//added preamble not possible
char *leaf_char_PTR_RisFieldNameC_RisInitC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char used_in, const char *refinement){
   assert(false && "JNI_Test_Gen_Fail");
   jstring tmp = (*env)->NewStringUTF(env, "NOTPOSSIBLE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
   return (*env)->GetStringUTFChars(env, tmp, NULL);
}

char *leaf_char_PTR_RisFieldNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicStaticCharField1");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

//added preamble not possible
char *leaf_char_PTR_RisFieldSigC_RisInitC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   assert(false && "JNI_Test_Gen_Fail");
   jstring tmp = (*env)->NewStringUTF(env, "NotPossible<init>");
   return (*env)->GetStringUTFChars(env, tmp, NULL);
}

char *leaf_char_PTR_RisFieldSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisInitC_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "<init>");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisInitC_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)V");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisInitC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "<init>");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisMethodNameC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "publicObjectMethod1");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisMethodSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "(I)Z");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res; 
}

char *leaf_char_PTR_RisUTF8C_RNot_isArrayClassSigC_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "AAAAAAAAAAAAAAAAAAAAAAAAAAa*AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

char *leaf_char_PTR_RisFieldSigC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"I");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
  /*if (strcmp(refinement, "@!isStaticF") == 0) {
        jstring tmp = (*env)->NewStringUTF(env,"I");
        return (*env)->GetStringUTFChars(env, tmp, NULL);
      }

  else if (strcmp(refinement, "@isStaticF@!isNULLF") == 0) {
        jstring tmp =  (*env)->NewStringUTF(env,"I");
        return (*env)->GetStringUTFChars(env, tmp, NULL);
      }
  else if (strcmp(refinement, "@!isNULLF@!isStaticF") == 0) {
        jstring tmp = (*env)->NewStringUTF(env,"I");
        return (*env)->GetStringUTFChars(env, tmp, NULL);
      }
  else{
        jstring tmp = (*env)->NewStringUTF(env,"I");
        return (*env)->GetStringUTFChars(env, tmp, NULL);
  }
  */
}

char *leaf_char_PTR_RisFieldNameC(JNIEnv *env, const char *used_in, const char *refinement){
  if (contains(refinement, "@!isStaticF")) {
        jstring tmp = (*env)->NewStringUTF(env,"publicIntField1I");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
  }
  else{
        jstring tmp = (*env)->NewStringUTF(env,"publicStaticIntField1");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
  }
}

jbyte *leaf_jbyte_PTR(JNIEnv *env, const char *used_in, const char *refinement){
        return malloc(ARRAY_SIZE * sizeof(jbyte));
}

jsize leaf_jsize_RNot_isValidIndexE(JNIEnv *env, const char *used_in, const char *refinement){
  return -1;
}

jbyteArray leaf_jbyteArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseByteArrayElements") == 0){
    if(jbyteArrayGlobal == NULL){
       jbyteArrayGlobal = (*env)->NewByteArray(env, 9);
       assert(jbyteArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jbyteArrayGlobal;
  }
  else if(strcmp(used_in, "GetByteArrayElements") == 0){
    jbyteArrayGlobal = (*env)->NewByteArray(env, 9);
    assert(jbyteArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jbyteArrayGlobal;
  }
  else{
    jbyteArray res = (*env)->NewByteArray(env,9);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res;
  }
}

jchar *leaf_jchar_PTR(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"BYTEDATA");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        jchar *res = (*env)->GetStringChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

/*
 * void Release<PrimitiveType>ArrayElements(JNIEnv *env, jcharArray array, jchar *elems, jint mode);
 * elems = GetCharArrayElements(env,array,0);
*/
jcharArray leaf_jcharArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseCharArrayElements") == 0){
    if (jcharArrayGlobal == NULL){
       jcharArrayGlobal = (*env)->NewCharArray(env, 9);
       assert(jcharArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jcharArrayGlobal;
  }
  else if(strcmp(used_in, "GetCharArrayElements") == 0){
    jcharArrayGlobal = (*env)->NewCharArray(env, 9);
    assert(jcharArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jcharArrayGlobal;
  }
  else{
    jcharArray res = (*env)->NewCharArray(env,9);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res; 
  }
}

jdouble *leaf_jdouble_PTR(JNIEnv *env, const char *used_in, const char *refinement){
       // return (*env)->NewDoubleArray(env, 10);
        return malloc(ARRAY_SIZE * sizeof(jdouble));
}

jdoubleArray leaf_jdoubleArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseDoubleArrayElements") == 0){
    if(jdoubleArrayGlobal == NULL){
       jdoubleArrayGlobal = (*env)->NewDoubleArray(env, ARRAY_SIZE);
       assert(jdoubleArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jdoubleArrayGlobal;
  }
  else if(strcmp(used_in, "GetDoubleArrayElements") == 0){
    jdoubleArrayGlobal = (*env)->NewDoubleArray(env, ARRAY_SIZE);
    assert(jdoubleArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jdoubleArrayGlobal;
  }
  else{
    jdoubleArray res = (*env)->NewDoubleArray(env,ARRAY_SIZE);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res; 
  }
}

//ignores RisEndWithBC. Similar effect
char *leaf_char_PTR_RisArrayClassSigC_RisEndWithBC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava.lang.Byte");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithCC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Character");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithDC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Double");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithFC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Float");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithIC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Integer");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithJC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Long");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithLC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Object");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithSC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Short");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithVC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Void");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisEndWithZC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/Boolean");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisInitC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[L<init>");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisArrayClassSigC_RisUTF8C_RNot_isClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"[Ljava/lang/StackTraceElement");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithBC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Boolean");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithCC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Char");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithDC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Double");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithFC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Float");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithIC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Integer");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithJC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Long");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithLC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Object");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithSC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Short");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithVC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Void");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

char *leaf_char_PTR_RisClassSigC_RisEndWithZC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/Boolean");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

//added preamble not possible
char *leaf_char_PTR_RisClassSigC_RisInitC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        assert(false && "JNI_Test_Gen_Fail");
        jstring tmp = (*env)->NewStringUTF(env,"L<init>");
        return (*env)->GetStringUTFChars(env, tmp, NULL);
}

char *leaf_char_PTR_RisClassSigC_RisUTF8C_RNot_isArrayClassSigC_RNot_isEndWithBC_RNot_isEndWithCC_RNot_isEndWithDC_RNot_isEndWithFC_RNot_isEndWithIC_RNot_isEndWithJC_RNot_isEndWithLC_RNot_isEndWithSC_RNot_isEndWithVC_RNot_isEndWithZC_RNot_isFieldNameC_RNot_isFieldSigC_RNot_isGetStringUTFCharC_RNot_isInitC_RNot_isMethodNameC_RNot_isMethodSigC_RNot_isNULLC(JNIEnv *env, const char *used_in, const char *refinement){
        jstring tmp = (*env)->NewStringUTF(env,"Ljava/lang/StrictMath");
        assert(tmp != NULL && "JNI_Test_Gen_Fail");
        char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res; 
}

jfloat *leaf_jfloat_PTR(JNIEnv *env, const char *used_in, const char *refinement){
      return malloc(ARRAY_SIZE * sizeof(jfloat));
      //return (*env)->NewFloatArray(env, 5);
}

jfloatArray leaf_jfloatArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseFloatArrayElements") == 0){
    if(jfloatArrayGlobal == NULL){
       jfloatArrayGlobal = (*env)->NewFloatArray(env, 5);
       assert(jfloatArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jfloatArrayGlobal;
  }
  else if(strcmp(used_in, "GetFloatArrayElements") == 0){
    jfloatArrayGlobal = (*env)->NewFloatArray(env, 5);
    assert(jfloatArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jfloatArrayGlobal;
  }
  else{
      jfloatArray res = (*env)->NewFloatArray(env, 5);
      assert(res != NULL && "JNI_Test_Gen_Fail");
      return res; 
  }
}

jint *leaf_jint_PTR(JNIEnv *env, const char *used_in, const char *refinement){
      //return (*env)->NewIntArray(env, 50);
      return malloc(ARRAY_SIZE * sizeof(jint));
}

jintArray leaf_jintArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseIntArrayElements") == 0){
    if(jintArrayGlobal == NULL){
       jintArrayGlobal = (*env)->NewIntArray(env, 50);
       assert(jintArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jintArrayGlobal;
  }
  else if(strcmp(used_in, "GetIntArrayElements") == 0){
    jintArrayGlobal = (*env)->NewIntArray(env, 50);
    assert(jintArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jintArrayGlobal;
  }
  else{
      jintArray res = (*env)->NewIntArray(env, 5);
      assert(res != NULL && "JNI_Test_Gen_Fail");
      return res; 
  }
}


jlong *leaf_jlong_PTR(JNIEnv *env, const char *used_in, const char *refinement){
      //return (*env)->NewLongArray(env, 30);
      return malloc(ARRAY_SIZE * sizeof(jlong));
}

jlongArray leaf_jlongArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseLongArrayElements") == 0){
    if(jlongArrayGlobal == NULL){
       jlongArrayGlobal = (*env)->NewLongArray(env, 30);
       assert(jlongArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jlongArrayGlobal;
  }
  else if(strcmp(used_in, "GetLongArrayElements") == 0){
    jlongArrayGlobal = (*env)->NewLongArray(env, 30);
    assert(jlongArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jlongArrayGlobal;
  }
  else{
      jlongArray res = (*env)->NewLongArray(env, 30);
      assert(res != NULL && "JNI_Test_Gen_Fail");
      return res; 
  }
}


jshort *leaf_jshort_PTR(JNIEnv *env, const char *used_in, const char *refinement){
      //return (*env)->NewShortArray(env, 30);
      return malloc(ARRAY_SIZE * sizeof(jshort));
}

char *leaf_char_PTR_RisFieldSigC_RisUTF8C(JNIEnv *env, const char *used_in, const char *refinement){
  jstring tmp = (*env)->NewStringUTF(env,"B");
  assert(tmp != NULL && "JNI_Test_Gen_Fail");
  char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
  assert(res != NULL && "JNI_Test_Gen_Fail");
  return res;
}

jshortArray leaf_jshortArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseShortArrayElements") == 0){
    if(jshortArrayGlobal == NULL){
       jshortArrayGlobal = (*env)->NewShortArray(env, 30);
       assert(jshortArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    return jshortArrayGlobal;
  }
  else if(strcmp(used_in, "GetShortArrayElements") == 0){
    jshortArrayGlobal = (*env)->NewShortArray(env, 30);
    assert(jshortArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jshortArrayGlobal;
  }
  else{
      jshortArray res = (*env)->NewShortArray(env, 30);
      assert(res != NULL && "JNI_Test_Gen_Fail");
      return res; 
  }
}

jchar *leaf_jchar_PTR_RisUnicodeJC_RNot_isNULLJC(JNIEnv *env, const char *used_in, const char *refinement){
      //return (*env)->NewCharArray(env, 50);
      return malloc(ARRAY_SIZE * sizeof(jchar));
}

jstring leaf_jstring_RisUnicodeS(JNIEnv *env, const char *used_in, const char *refinement){
      jstring res = (*env)->NewStringUTF(env,"TESTDATAAAAAAAAAAAAAAAAA");
      assert(res != NULL && "JNI_Test_Gen_Fail");
      return res; 
}

void JNICALL g_impl(JNIEnv *env, jobject self){
  printf("Registered Native Function\n");
}

JNINativeMethod *leaf_JNINativeMethod_PTR(JNIEnv *env, const char *used_in, const char *refinement){
 JNINativeMethod nm;
   nm.name = "g";
   /* method descriptor assigned to signature field */
   nm.signature = "()V";
   nm.fnPtr = g_impl;
   //(*env)->RegisterNatives(env, cls, &nm, 1); 
   return &nm;
}

jint leaf_jint_RisPositiveJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isThisArrayLenJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
 return 5; 
}

jboolean *leaf_jboolean_PTR(JNIEnv *env, const char *used_in, const char *refinement) {
    if (strcmp(used_in, "SetBooleanArrayRegion") == 0) {
        return malloc(ARRAY_SIZE * sizeof(jboolean));
    }
    else {
        return NULL;
    }
}

jbooleanArray leaf_jbooleanArray(JNIEnv *env, const char *used_in, const char *refinement){
  if(strcmp(used_in, "ReleaseBooleanArrayElements") == 0){
    if(jbooleanArrayGlobal == NULL){
       jbooleanArrayGlobal = (*env)->NewBooleanArray(env, ARRAY_SIZE);
       assert(jbooleanArrayGlobal != NULL && "JNI_Test_Gen_Fail");
       jbooleanPtrGlobal = (*env)->GetBooleanArrayElements(env,jbooleanArrayGlobal,NULL);
       assert(jbooleanPtrGlobal != NULL && "JNI_Test_Gen_Fail");
    }
    assert(jbooleanArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    return jbooleanArrayGlobal;
  }
  else if(strcmp(used_in, "GetBooleanArrayElements") == 0){
    if (contains(refinement, "@!isThisBooleanArray")) {
        jbooleanArray res = (*env)->NewBooleanArray(env, ARRAY_SIZE);
        assert(res != NULL && "JNI_Test_Gen_Fail");
        return res;
     }
    else {
       jbooleanArrayGlobal = (*env)->NewBooleanArray(env, ARRAY_SIZE);
       assert(jbooleanArrayGlobal != NULL && "JNI_Test_Gen_Fail");
       jbooleanPtrGlobal = (*env)->GetBooleanArrayElements(env,jbooleanArrayGlobal,NULL);
       assert(jbooleanPtrGlobal != NULL && "JNI_Test_Gen_Fail");
       return jbooleanArrayGlobal;
    }
  }
  else{
    jbooleanArray res = (*env)->NewBooleanArray(env, ARRAY_SIZE);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res; 
  }
}

jint leaf_jint_RisPositiveJI_RisThisArrayLenJI_RNot_isJNI_ABORTJI_RNot_isJNI_COMMITJI_RNot_isNegativeJI_RNot_isZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
 return 3; 
}

jint leaf_jint_RisJNI_ABORTJI(JNIEnv *env, const char *used_in, const char *refinement){
  return JNI_ABORTJI;
}

jint leaf_jint_RisJNI_COMMITJI(JNIEnv *env, const char *used_in, const char *refinement){
  return JNI_COMMITJI;
}

jint leaf_jint_RisZeroJI(JNIEnv *env, const char *used_in, const char *refinement){
  return 0;
}

jboolean *leaf_jboolean_PTR_RisThisBooleanArray_RNot_isGetBooleanArrayElements_RNot_isNULLJB(JNIEnv *env, const char *used_in, const char *refinement){
 if(jbooleanPtrGlobal == NULL){
    jbooleanArrayGlobal = (*env)->NewBooleanArray(env, ARRAY_SIZE);
    assert(jbooleanArrayGlobal != NULL && "JNI_Test_Gen_Fail");
    jbooleanPtrGlobal = (*env)->GetBooleanArrayElements(env,jbooleanArrayGlobal,NULL);
    assert(jbooleanPtrGlobal != NULL && "JNI_Test_Gen_Fail");
  }
  return jbooleanPtrGlobal;
}

jboolean *leaf_jboolean_PTR_RNot_isGetBooleanArrayElements_RNot_isNULLJB_RNot_isThisBooleanArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jboolean));
}

//not possible : dependancy refine limitation
jbyte *leaf_jbyte_PTR_RisBytePointerClassInfo_RisThisByteArray_RNot_isGetByteArrayElements_RNot_isNULLB(JNIEnv *env, const char *used_in, const char *refinement){
  return leaf_jbyte_PTR_RisBytePointerClassInfo(env, "", "");
}

jbyte *leaf_jbyte_PTR_RisBytePointerClassInfo_RNot_isGetByteArrayElements_RNot_isNULLB_RNot_isThisByteArray(JNIEnv *env, const char *used_in, const char *refinement){
  return leaf_jbyte_PTR_RisBytePointerClassInfo(env, "", "");
}

//not possible : dependancy limitation
jbyte *leaf_jbyte_PTR_RisThisByteArray_RNot_isBytePointerClassInfo_RNot_isGetByteArrayElements_RNot_isNULLB(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jbyte));
}

jbyte *leaf_jbyte_PTR_RNot_isBytePointerClassInfo_RNot_isGetByteArrayElements_RNot_isNULLB_RNot_isThisByteArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jbyte));
}

//not possible : dependancy limitation
jchar *leaf_jchar_PTR_RisThisCharArray_RisUnicodeJC_RNot_isGetCharArrayElementsJC_RNot_isGetStringCharsJC_RNot_isGetStringCriticalJC_RNot_isNULLJC(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jchar));
}

jchar *leaf_jchar_PTR_RisUnicodeJC_RNot_isGetCharArrayElementsJC_RNot_isGetStringCharsJC_RNot_isGetStringCriticalJC_RNot_isNULLJC_RNot_isThisCharArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jchar));
}

//not possible : dependancy limitation
jdouble *leaf_jdouble_PTR_RisThisDoubleArray_RNot_isGetDoubleArrayElements_RNot_isNULLJD(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jdouble));
}

jdouble *leaf_jdouble_PTR_RNot_isGetDoubleArrayElements_RNot_isNULLJD_RNot_isThisDoubleArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(1 * sizeof(jdouble));
}

//not possible : dependancy limitation
jfloat *leaf_jfloat_PTR_RisThisFloatArray_RNot_isGetFloatArrayElements_RNot_isNULLJF(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jfloat));
}

jfloat *leaf_jfloat_PTR_RNot_isGetFloatArrayElements_RNot_isNULLJF_RNot_isThisFloatArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jfloat));
}

//not possible : dependancy limitation
jlong *leaf_jlong_PTR_RisThisLongArray_RNot_isGetLongArrayElements_RNot_isNULLJL(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(ARRAY_SIZE * sizeof(jlong));
}

jlong *leaf_jlong_PTR_RNot_isGetLongArrayElements_RNot_isNULLJL_RNot_isThisLongArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(5 * sizeof(jlong));
}

//not possible : dependancy limitation
void *leaf_void_PTR_RisThisVoidArray_RNot_isGetPrimitiveArrayCritical_RNot_isNULLV(JNIEnv *env, const char *used_in, const char *refinement){
    jintArray res = (*env)->NewIntArray(env, ARRAY_SIZE);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res; 
}

void *leaf_void_PTR_RNot_isGetPrimitiveArrayCritical_RNot_isNULLV_RNot_isThisVoidArray(JNIEnv *env, const char *used_in, const char *refinement){
    jbooleanArray res = (*env)->NewBooleanArray(env, ARRAY_SIZE);
    assert(res != NULL && "JNI_Test_Gen_Fail");
    return res;
}

//not possible : dependancy limitation
jshort *leaf_jshort_PTR_RisThisShortArray_RNot_isGetShortArrayElements_RNot_isNULLJS(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(5 * sizeof(jshort));
}

jshort *leaf_jshort_PTR_RNot_isGetShortArrayElements_RNot_isNULLJS_RNot_isThisShortArray(JNIEnv *env, const char *used_in, const char *refinement){
  return malloc(5 * sizeof(jshort));
}

jboolean leaf_jboolean(JNIEnv *env, const char *used_in, const char *refinement){
  return 1;
}

jbyte leaf_jbyte(JNIEnv *env, const char *used_in, const char *refinement){
  return 42;
}

jchar leaf_jchar(JNIEnv *env, const char *used_in, const char *refinement){
  return 'a';
}

jdouble leaf_jdouble(JNIEnv *env, const char *used_in, const char *refinement){
  return 10.0;
}

jfloat leaf_jfloat(JNIEnv *env, const char *used_in, const char *refinement){
  return 10.0;
}

jint leaf_jint(JNIEnv *env, const char *used_in, const char *refinement){
  return 10;
}

jlong leaf_jlong(JNIEnv *env, const char *used_in, const char *refinement){
  return 10;
}

jsize leaf_jsize_RisValidIndexE(JNIEnv *env, const char *used_in, const char *refinement){
  return 1;
}

jobjectArray leaf_jobjectArray(JNIEnv *env, const char *used_in, const char *refinement){
  jstring jstr = (*env)->NewStringUTF(env, "HSJ");
  assert(jstr != NULL && "JNI_Test_Gen_Fail");
  jclass stringClass = (*env)->FindClass(env, "java/lang/String");
  assert(stringClass != NULL && "JNI_Test_Gen_Fail");
  jobjectArray res = (*env)->NewObjectArray(env, 1, stringClass, jstr);
  assert(res != NULL && "JNI_Test_Gen_Fail");
  return res; 
}

jshort leaf_jshort(JNIEnv *env, const char *used_in, const char *refinement){
  return 5;
}

char *leaf_char_PTR(JNIEnv *env, const char *used_in, const char *refinement){
   jstring tmp = (*env)->NewStringUTF(env, "HSJ");
   assert(tmp != NULL && "JNI_Test_Gen_Fail");
   char *res = (*env)->GetStringUTFChars(env, tmp, NULL);
   assert(res != NULL && "JNI_Test_Gen_Fail");
   return res;
}

JNIEXPORT int JNICALL Java_HelloJNI_sayHello (JNIEnv *env, jobject thisObj){
   JNIEnv *leaf_env = env;
