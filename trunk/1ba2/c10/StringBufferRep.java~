
class StringBufferRep {
	char[] data;

	public StringBufferRep() {
		data = new char[16];
	}

	public StringBufferRep(String str) {
		data = new char[str.length()];
		for(int i = 0; i < str.length(); i++)
			data[i] = str.charAt(i);
	}

	public int length(){return data.length;}
	public int capacity(){return data.length;}

	public char charAt(int index){
		if((index < 0) || (index >= data.length))
			return (char)0;
		return data[index];
	}

	public void setCharAt(int index, char ch){
		if((index < 0) || (index >= data.length))
			return ;
		data[index] = ch;
	}

	public StringBufferRep append(String str){
		char[] nd = new char[data.length + str.length()];
		int i;

		for(i = 0; i < data.length; i++)
			nd[i] = data[i];

		for(i = 0; i < str.length(); i++)
			nd[data.length + i] = str.charAt(i);

		data = nd;
		return this;
	}

	public StringBufferRep append(char c){
		return append(new Character(c).toString());
	}

	public StringBufferRep append(int i){
		return append(Integer.toString(i));
	}

	public StringBufferRep append(long l){
		return append(Long.toString(l));
	}

	public StringBufferRep append(float f){
		return append(Float.toString(f));
	}

	public StringBufferRep append(double d){
		return append(Double.toString(d));
	}

	public StringBufferRep append(boolean b){
		return append(new Boolean(b).toString());
	}

	public StringBufferRep insert(int index, String str){
		char[] nd = new char[data.length + str.length()];
		int i, j;

		if((index < 0) || (index >= data.length))
			return null;

		for(i = 0; i < index; i++)
			nd[i] = data[i];

		for(; i - index < str.length(); i++)
			nd[i] = str.charAt(i - index);

		j = index;
		while(j < data.length)
			nd[i++] = data[j++];  

		data = nd;

		return this;
	}

	public StringBufferRep insert(int index, char c){
		return insert(index, new Character(c).toString());
	}

	public StringBufferRep insert(int index, int i){
		return insert(index, Integer.toString(i));
	}

	public StringBufferRep insert(int index, long l){
		return insert(index, Long.toString(l));
	}

	public StringBufferRep insert(int index, float f){
		return insert(index, Float.toString(f));
	}

	public StringBufferRep insert(int index, double d){
		return insert(index, Double.toString(d));
	}

	public StringBufferRep insert(int index, boolean b){
		return insert(index, new Boolean(b).toString());
	}

	public String toString(){
		return new String(data);
	}
}
