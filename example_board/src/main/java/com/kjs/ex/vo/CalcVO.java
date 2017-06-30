package com.kjs.ex.vo;

public class CalcVO {
	
	private String formula;
	private Double result;
	
	
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	public Double getResult() {
		return result;
	}
	public void setResult(Double result) {
		this.result = result;
	}
	
	@Override
	public String toString() {
		return "CalcVO [formula=" + formula + ", result=" + result + "]";
	}
	
	
	
	

}
