package com.test;

import org.junit.jupiter.api.Test;

import java.time.LocalDate;
import java.util.Date;

public class MainTest {
    @Test
    public void timeClass() {
//        LocalDate now = LocalDate.now();
//        System.out.println("now=" + now);
        Date date = new Date();
        String string = LocalDate.now().toString();
        System.out.println("date=" + string);
    }

    @Test
    public void testTheEnum() {
        Date date = new Date();
        System.out.println();
    }
}
