import os

for x in range(34990):
#for x in range(0,20):
   # print(str(x)+"\n")

    #if os.path.isfile('../test'+str(x)+'/libHello.so'):
    #if os.path.isfile('../test'+str(x)+'/HelloJNI.h'):
        #pass
        #print('exist '+str(x))
    #else:
        #print('not exist '+str(x))

    os.environ['LD_LIBRARY_PATH'] = '/hsj/test'+str(x)
    os.system('echo $LD_LIBRARY_PATH')
    os.system('script -c "{ java -Xcheck:jni -esa HelloJNI; }"')
