package com.july.networkdisk.dao;

import org.apache.ibatis.session.*;

public class BaseDao
{
    protected SqlSessionFactory sqlSessionFactory;
    
    public void setSqlSessionFactory(final SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }
}
