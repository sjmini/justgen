# JUSTGen  [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4520044.svg)](https://doi.org/10.5281/zenodo.4520044)

This repository provides the tool for the paper "JUSTGen: Effective Test Generation for Unspecified JNI Behaviors on JVMs" accepted at ICSE 2021.

## Environment

JUSTGen is verified in following OS:

1. MacOS 10.13.5

2. Linux (Ubuntu 12.10)

## Structure
1. test/rule : JNI specification expressed in our domain specific language

2. test_case : Test programs will be generated in this folder

3. slang.exe : Executable file of JUSTGen

4. src : Source files of JUSTGen are placed in this folder

5. test/bitvector : List of predefined bitvectors

6. test/refine_meaning : Explanation of each refinements used in our DSL

7. test/code/* : Template codes for generating test programs

8. unspec_dsl : JNI specification expressed in our DSL with found unspecified cases

9. gen_result : List of identified unspecified cases

## Getting Started

### Prerequisites
* Ocaml version 4.08.1
* Opam 2.0.5
* z3.4.8.1
* dune 2.8.1
* menhir 20201216

### Building JUSTGen

1. clone the source code
```
# git clone https://github.com/sjmini/justgen.git
# cd justgen
```
2. build the source code via make command
```
# make
```
slang.exe file will be generated.

### Executing JUSTGen 
JUSTGen can be executed by running slang.exe file.

JUSTGen consists of two phases; 1) Finding unspecified cases in JNI specification 2) Generating test programs triggering the behaviors of identified unspecified cases.

#### Finding Unspecified Cases in JNI Specification

Run the JUSTGen through <i>find_unspec</i> option.

```
# export DYLD_LIBRARY_PATH=<z3 path>
For artifact evaluation, the path is export DYLD_LIBRARY_PATH=/home/justgen/.opam/default/lib/z3/
# ./slang.exe find_unspec |tee unspec_dsl
```
By running above commands, JUSTGen finds unspecified cases and summaized the unspecified cases in unspec_dsl file

#### Generating Test Programs

Run the JUSTGen through <i>gen_program</i> option. 

Note that the unspec_dsl file must be generated by running <i>find_unspec</i> option before executing the JUSTGen with <i>gen_program</i> option.
```
# ./slang.exe gen_program |tee gen_result
```
By running above command, JUSTGen generates test programs triggering the behaviors of identified unspecified cases summarized in the unspec_dsl file.

The test programs will be placed in test_case folder.

#### Result
Currently, the JNI specification expressed in our DSL defines 37 types and 105 refinement types. 
Based on this JNI specification, the JUSTGen finds 34,990 unspecified cases.

The unspecified cases can be found in <i>gen_result</i> file.
```
# cat gen_result
//test0;Unspecified: CallBooleanMethod(JNIEnv*, jarray, jmethodID@isInThisClassM && isJBooleanM && isPrivateM && !isStaticM, ...)
//test1;Unspecified: CallBooleanMethod(JNIEnv*, jbooleanArray@isNULLJZA, jmethodID@isInThisClassM && isJBooleanM && isPrivateM && !isStaticM, ...)
//test2;Unspecified: CallBooleanMethod(JNIEnv*, jbooleanArray@!isNULLJZA, jmethodID@isInThisClassM && isJBooleanM && isPrivateM && !isStaticM, ...)
...
```
There will be 34,990 test programs in <i>test_case</i> folder.
```
# ls test_case
...
test15230	test2048	test25729	test30978	test4736	test9986
test15231	test20480	test2573	test30979	test4737	test9987
test15232	test20481	test25730	test3098	test4738	test9988
...
```

By running the generated test programs, you can test JNI behaviors of JVM.
If you change the content of <i>test/rule</i> file according to the targeted specification, the justgen will find the new unspecified cases.
Enjoy!

## Artifact Evaluation
### With submitted VM Image

All the necessary sw packages are installed in this VM images.
The tester only need to follow above instruction. (e.x. clone, make, find_unspec, gen_program)

### Without VM image

The necessary SW packages should be installed by tester manually.
SW packages listed in <i>Prerequisites</i> are required. 
It can be install with following commands:
```
//tested in ubuntu 12.10
sudo add-apt-repository ppa:avsm/ppa
sudo apt update
sudo apt-get install opam
opam install dune
opam install menhir
opam install z3.4.8.9

//Additionally following packages was required
opam install ppx_compare 
opam install ppx_sexp_conv
sudo apt-get install libgmp-dev
sudo apt-get install python
opam install core
sudo apt-get install libz3-dev
opam install parmap
```

## Bug Reports
JUSTGen found bugs and limitations in JVMs and they are fixed by JVM vendors

https://github.com/eclipse/openj9/issues/10183

https://github.com/eclipse/openj9/issues/9452

https://github.com/eclipse/openj9/issues/10191

https://github.com/eclipse/openj9/issues/10210

https://github.com/eclipse/openj9/issues/10231

https://github.com/eclipse/openj9/issues/10272

https://github.com/eclipse/openj9/issues/10286

https://github.com/eclipse/openj9/issues/10310

https://github.com/eclipse/openj9/issues/10318

https://github.com/eclipse/openj9/issues/10473

https://github.com/eclipse/openj9/issues/10476

https://github.com/eclipse/openj9/issues/10477

https://github.com/eclipse/openj9/issues/10479

https://github.com/eclipse/openj9/issues/10480

https://github.com/oracle/graal/issues/2815

https://github.com/corretto/corretto-11/issues/128

https://github.com/eclipse/openj9/issues/10481

https://github.com/eclipse/openj9/issues/10481

https://github.com/eclipse/openj9/issues/10484

https://github.com/eclipse/openj9/issues/10484


## Publication
```
JUSTGen: Effective Test Generation for Unspecified JNI Behaviors on JVMs. IEEE/ACM 43nd International Conference on Software Engineering, Madrid, Spain, 23-29 May 2021.

@inproceedings{Hwang2021justgen,
  title={JUSTGen: Effective Test Generation for Unspecified JNI Behaviors on JVMs},
  author={Sungjae Hwang, Sungho Lee, Jihoon Kim, Sukyoung Ryu},
  booktitle={Proceedings of the 43nd International Conference on Software Engineering},
  year={2021}
}
```

Copyright (c) 2021, KAIST
