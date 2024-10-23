package data;

public class Dot{

    private final int x;
    private final double y;
    private final int r;

    private boolean status;


    public Dot(int x, double y, int r) {
        this.x = x;
        this.y = y;
        this.r = r;
    }





    public int getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public int getR() {
        return r;
    }

    public boolean isStatus() {
        return status;
    }

    public void status(boolean inTheGraphic) {
        status = inTheGraphic;
    }
}