// $Id$

int ackerman(int x,int y)
{
		  if(x == 0)
					 return y + 1;
		  else if (y == 0)
					 return ackerman(x-1, 1);
		  else
					 return ackerman(x-1,ackerman(x,y-1));
}

int main()
{
		  int i = 6;

		  int r = ackerman(3,i);

		  return r;

}
