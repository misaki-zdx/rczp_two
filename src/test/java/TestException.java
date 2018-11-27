import org.junit.Test;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class TestException
{
    public TestException()
    {
    }
    boolean testEx() throws Exception
    {
        boolean ret = true;
        try
        {
            ret =testEx1();
        }
        catch (Exception e)
        {
            System.out.println("testEx,catch exception");
            ret =false;
            throw e;
        }
        finally
        {
            System.out.println("testEx,finally; return value=" + ret);
            return ret;
        }
    }
    boolean testEx1() throws Exception
    {
        boolean ret = true;
        try
        {
            ret =testEx2();
            if(!ret)
            {
                return false;
            }
            System.out.println("testEx1,at the end of try");
            return ret;
        }
        catch (Exception e)
        {
            System.out.println("testEx1,catch exception");
            ret =false;
            throw e;
        }
        finally
        {
            System.out.println("testEx1,finally; return value=" + ret);
            return ret;
        }

    }
    boolean testEx2() throws Exception
    {
        boolean ret = true;
        try
        {
            int b =12;
            int c;
            for(int i = 2; i >= -2; i--)
            {
                c= b / i;
                System.out.println("i="+ i);
            }
            return true;
        }
        catch (Exception e)
        {
            System.out.println("testEx2,catch exception");
            ret =false;
            throw e;
        }
        finally
        {
            System.out.println("testEx2,finally; return value=" + ret);
            return ret;
        }
    }

    @Test
    public  void test()
    {
        TestException testException1 =new TestException();
        try
        {
            testException1.testEx();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
@Test
    public void f3(){
        try {
            //System.out.println(3/0);
            List<Integer> useCases = new ArrayList<>();
            //添加数据到这个集合
            Collections.addAll(useCases, 47, 48, 49, 50);
            System.out.println(useCases);
        }catch (Exception e){
            e.printStackTrace();
        }
        System.out.println("之后");
    }


}
