package MyEnum;

/**
 * @Author: Misaki
 * @Date: 10:38
 */
public enum Weekday {
    /**
     * 星期简写
     */
    SUN(1),MON(2),TUS(3),WED(3),THU(4),FRI(8),SAT(6);
    private int value;
    private static final int COUNT = 7;

    Weekday(int value){
        this.value = value;
    }

    public static int getWeek(Weekday day){
        return day.value;
    }

    public static Weekday getNextDay(Weekday nowDay){
        int nextDayValue = nowDay.value;

        if (++nextDayValue == COUNT){
            nextDayValue =0;
        }

        return getWeekdayByValue(nextDayValue);
    }

    public static Weekday getWeekdayByValue(int value) {
        for (Weekday c : Weekday.values()) {
            if (c.value == value) {
                return c;
            }
        }
        return null;
    }
}
