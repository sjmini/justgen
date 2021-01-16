# JUSTGen 

This repository provides the tool for the paper "JUSTGen: Effective Test Generation for Unspecified JNI Behaviors on JVMs" accepted at ICSE 2021.

## Environment

JUSTGen is verified in following OS:

1. MacOS 10.13.5

2. Linux xxxxx

## Structure
1. test/rule : JNI specification expressed in our domain specific language

2. test_case : Test programs will be generated in this folder

3. slang.exe : Executable file of JUSTGen

4. src : Source files of JUSTGen are placed in this folder

5. test/bitvector : List of predefined bitvectors

6. test/refine_meaning : Explanation of each refinements used in our DSL

7. test/code/* : Template codes for generating test programs

## Getting Started

### Prerequisites
* Ocaml version 4.08.1
* Opam 2.0.5
* z3.4.8.1

### Building JUSTGen

1. clone the source code
```
git clone https://github.com/sjmini/justgen.git
```
2. build the source code via make command
```
make
```
slang.exe file will be generated.

### Executing JUSTGen 
JUSTGen can be executed by running slang.exe file.

JUSTGen consists of two phases; 1) Finding unspecified cases in JNI specification 2) Generating test programs triggering the behaviors of identified unspecified cases.

#### Finding Unspecified Cases in JNI Specification

Run the JUSTGen through <i>find_unspec</i> option.

```
# export DYLD_LIBRARY_PATH=<z3 path>.opam/default/lib/z3/
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
There will be 34,990 test programs in test_case folder.

## Artifact Evaluation
### With provided docker image

### without docker image


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
