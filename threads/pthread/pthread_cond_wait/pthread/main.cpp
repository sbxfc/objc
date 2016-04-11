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

int socket_connected;

pthread_mutex_t mymutex = PTHREAD_MUTEX_INITIALIZER;
pthread_cond_t mycond = PTHREAD_COND_INITIALIZER;

/**
 * 套接字联网
 */
static void
*socket_conn(void *vptr_args)
{
    int i;
    for ( i=0; i<20; i++) {
        printf("-->%i \n",i);
        sleep(1);
        if(i == 10){
            //十秒之后,联网成功!
            pthread_cond_broadcast(&mycond);
        }
    }
    return NULL;
}

int
main(void)
{
    /**
     * 线程ID.出于移植目的，不能把它作为整数处理,
     * 并且应使用函数pthread_equal()对两个线程ID进行比较。
     */
    pthread_t tid;
    
    printf("创建线程!\n");
    
    /**
     * 使用函数 pthread_create 创建线程。
     * 线程创建失败不会设置errno而是直接返回错误值。
     */
    if (pthread_create(&tid, NULL, socket_conn, NULL) != 0)
    {
        printf("error creating thread.");
        return EXIT_FAILURE;
    }
    
    printf("等待联网!\n");
    pthread_mutex_lock(&mymutex);
    pthread_cond_wait(&mycond, &mymutex);
    printf("联网成功!\n");
    
    return EXIT_SUCCESS;
}