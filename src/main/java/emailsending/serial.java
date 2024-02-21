package emailsending;

import java.io.Serializable;

public  class serial {
	private String name;
	private int age;
	public void setName(String name) {
		this.name=name;
	}
	serial(){
	System.out.println("hello");	
	}
	public String getname() {
		return name;
	}
	public int go() {
		return 1;
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	serial s1=	new serial();
	s1.setName("this");
	System.out.println(s1.getname());
System.out.println(s1.go());
	}

}
