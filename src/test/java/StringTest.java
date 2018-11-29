import org.junit.Test;

/**
 * 测试类
 */
public class StringTest {
    /**
     * 测试string.equals，hashcode
     *
     *  >>equals return true；hashcode 不一定相同
     */
    @Test
    public void t1() {
    String str1 = new String("abc");
    String str2 = "abc";
        boolean abc = str1.equals(str2);
        int i = str1.hashCode();
        int i1 = str2.hashCode();
        System.out.println(abc+";:"+i+";i1:"+i1);
    }
}
