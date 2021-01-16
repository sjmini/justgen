public class Jtemplate{
  
  //static private
  //byte, short, int, long, float, double
  //char, string, boolean
  private static byte staticby1 = 127;
  private static byte staticby2 = -128;
  private static short staticsh1 = 32767;
  private static short staticsh2 = -32768;
  private static int statici1 = 1;
  private static int statici2 = -1;
  private static long staticl1 = 100;
  private static long staticl2 = -100;
  private static float staticf1 = 10.4f;;
  private static double staticd2 = 1232.55;
  private static char staticch1 = 'x';
  private String staticstr2 = "test1";
  private static boolean staticbol1 = true;

  //static public
  public static byte pstaticby1 = 127;
  public static byte pstaticby2 = -128;
  public static short pstaticsh1 = 32767;
  public static short pstaticsh2 = -32768;
  public static int pstatici1 = 1;
  public static int pstatici2 = -1;
  public static long pstaticl1 = 100;
  public static long pstaticl2 = -100;
  public static float pstaticf1 = 10.4f;;
  public static double pstaticd2 = 1232.55;
  public static char pstaticch1 = 'x';
  public static String pstaticstr2 = "test1";
  public static boolean pstaticbol1 = true;

  //non-static private
  private byte by1 = 127;
  private byte by2 = -128;
  private short sh1 = 32767;
  private short sh2 = -32768;
  private int i1 = 1;
  private int i2 = -1;
  private long l1 = 100;
  private long l2 = -100;
  private float f1 = 10.4f;;
  private double d2 = 1232.55;
  private char ch1 = 'x';
  private String str2 = "test1";
  private boolean bol1 = true;
  
  //non-static public
  public byte pby1 = 127;
  public byte pby2 = -128;
  public short psh1 = 32767;
  public short psh2 = -32768;
  public int pi1 = 1;
  public int pi2 = -1;
  public long pl1 = 100;
  public long pl2 = -100;
  public float pf1 = 10.4f;;
  public double pd2 = 1232.55;
  public char pch1 = 'x';
  public String pstr2 = "test1";
  public boolean pbol1 = true;
  
  
  private native void enterJniTest ();

  public static void main(String[] args) {
    new Jtemplate().enterJniTest();  
  }

}
