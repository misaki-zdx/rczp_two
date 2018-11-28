package MyEnum;

import org.junit.Test;

import java.util.Arrays;

/**
 * Author: Misaki
 * Project:rczp
 * Date: 2018-11-28-10:44
 */
public class EnumTest {
    @Test
    public void test1() {
        //ordinal 序数 枚举类会默认赋值ordinal（当然只会傻傻的从0开始）
        Weekday fri = Weekday.FRI;
        int ordinal = fri.ordinal();
        Weekday[] values = Weekday.values();
        System.out.println(Arrays.toString(values)+";"+Weekday.getWeek(fri));

    }
}
