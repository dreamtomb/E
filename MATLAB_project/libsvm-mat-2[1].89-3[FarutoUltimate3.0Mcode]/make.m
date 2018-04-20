% This make.m is used under Windows

mex -largeArrayDims -c svm.cpp
mex -largeArrayDims -c svm_model_matlab.c
mex -largeArrayDims svmtrain.c svm.obj svm_model_matlab.obj
mex -largeArrayDims svmpredict.c svm.obj svm_model_matlab.obj
mex -largeArrayDims libsvmread.c
mex -largeArrayDims libsvmwrite.c
