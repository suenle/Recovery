package com.huifu.action;


public class text2 {
	private static ThreadLocal<Integer> seqNum=new ThreadLocal<Integer>(){
		public Integer InitialValue(){
			
			return 0;
		}
		
	};
	
	public int getNextNum(){
		seqNum.set(seqNum.get()+1);
		return seqNum.get();
	}
	
	
	public static void main(String[] args) {
	}

}
