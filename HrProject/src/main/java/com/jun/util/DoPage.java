package com.jun.util;

public class DoPage {
    private static final  int PAGESIZE=2;
    public static int getTotalPages(int totalRows){
        return  totalRows%PAGESIZE==0?totalRows/PAGESIZE:totalRows/PAGESIZE+1;
    }
}
