package com.nhom8.camera.util;

public class Test {
    public static void main(String[] args) {
        String s = "DSC-W690/SC E32";
        String result  = GenerateSlug.makeSlug(s);
        System.out.println(result);
    }
}
