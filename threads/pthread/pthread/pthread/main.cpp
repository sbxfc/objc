//
//  main.cpp
//  pthread
//
//  Created by sbxfc on 16/4/11.
//  Copyright © 2016年 me.rungame. All rights reserved.
//


#include <iostream>
#include <time.h>
#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int myglobal;

pthread_mutex_t mymutex = PTHREAD_MUTEX_INITIALIZER;

/**
 * thread_func() 接受 void* 作为参数，同时返回值的类型也是 void*。
 * 这表明可以用 void* 向新线程传递任意类型的数据，新线程完成时也可返回任意类型的数据。
 */
static void *thread_func(void *vptr_args)
{
    int i,j;
    for ( i=0; i<20; i++) {
        pthread_mutex_lock(&mymutex);
        j=myglobal;
        j=j+1;
        printf(".");
        fflush(stdout);
        sleep(1);
        myglobal=j;
        pthread_mutex_unlock(&mymutex);
    }
    return NULL;
}

int main(void)
{
    int i;
    
    /**
     * 线程ID.出于移植目的，不能把它作为整数处理,
     * 并且应使用函数pthread_equal()对两个线程ID进行比较。
     */
    pthread_t tid;
    
    /**
     * 使用函数 pthread_create 创建线程。
     * 线程创建失败不会设置errno而是直接返回错误值。
     */
    if (pthread_create(&tid, NULL, thread_func, NULL) != 0)
    {
        printf("error creating thread.");
        return EXIT_FAILURE;
    }
    
    
    for (i = 0; i < 20; i++)
    {
        pthread_mutex_lock(&mymutex);
        myglobal = myglobal+1;
        pthread_mutex_unlock(&mymutex);
        
        printf("o");
        fflush(stdout);
        sleep(1);
    }
    
    /**
     * 阻塞当前的线程，直到另外一个线程(tid)运行结束
     * 也可以理解为,线程tid结束时,将线程tid与主线程合并在一起
     */
    if (pthread_join(tid, NULL) != 0)
    {
        return EXIT_FAILURE;
    }
    
    printf("\nmyglobal equals %d\n",myglobal);
    
    return EXIT_SUCCESS;
}