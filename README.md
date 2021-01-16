# JUSTGen 

This repository provides the tool for the paper "JUSTGen: Effective Test Generation for Unspecified JNI Behaviors on JVMs" accepted at ICSE 2021.

## Getting Started

### Prerequisites
* Ocaml version 4.08.1
* Opam 2.0.5
* z3.4.8.1

### Building

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
JUSTGen consists of two phase; 1) Finding unspecified cases in JNI specification 2) Generating test programs triggering the behaviors of identified unspecified cases.

#### Finding Unspecified Cases in JNI Specification

```
export DYLD_LIBRARY_PATH=<z3 path>.opam/default/lib/z3/
./slang.exe find_unspec |tee unspec_dsl
```
By running above commands, JUSTGen finds unspecified cases and summaized the unspecified cases in unspec_dsl file

#### Generating Test Programs

```
./slang.exe gen_program |tee gen_result
```
By running above command, JUSTGen generates test programs triggering the behaviors of unspecified cases in unspec_dsl file.
The test programs will be placed in test_case folder.

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
