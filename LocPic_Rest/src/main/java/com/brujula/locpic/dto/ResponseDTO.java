package com.brujula.locpic.dto;


public class ResponseDTO
{
	private Boolean result;
	private Object data;

	public Boolean getResult()
	{
		return result;
	}

	public void setResult(Boolean result)
	{
		this.result = result;
	}

	public Object getData()
	{
		return data;
	}

	public void setData(Object data)
	{
		this.data = data;
	}
}
