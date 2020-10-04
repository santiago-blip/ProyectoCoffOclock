
package Clases;

public class Grafica {
    private int mes;
    private double totalGrafica;
    private int year;
    private int Ryear;
    public Grafica(){
        
    }

    public Grafica(int mes, double totalGrafica, int año) {
        this.mes = mes;
        this.totalGrafica = totalGrafica;
        this.year = año;
    }
    public int getMes() {
        return mes;
    }

    public void setMes(int mes) {
        this.mes = mes;
    }

    public double getTotalGrafica() {
        return totalGrafica;
    }

    public void setTotalGrafica(double totalGrafica) {
        this.totalGrafica = totalGrafica;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getRyear() {
        return Ryear;
    }

    public void setRyear(int Ryear) {
        this.Ryear = Ryear;
    }
    
    
    
}
