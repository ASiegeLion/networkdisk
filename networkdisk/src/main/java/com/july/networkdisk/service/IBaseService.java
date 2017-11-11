package com.july.networkdisk.service;

import java.util.*;

public interface IBaseService<T>
{
    void save( T p0);
    
    void update( T p0);
    
    boolean delete( String p0);
    
    T get( String p0);
    
}
