int main()
{
	int i=2;
	int t=2;
	int count=0;
	int check=0;
	int ans[30]={0};
	while(t<=100)
	{
		i=2;
		check=1;
		while(i<(t/2+1))
		{
			if(t%i==0)
			{
				check=0;
				break;
			}
			i++;
		}
		
		if(check==1)
		{
			ans[count++]=t;
		}
		
		t++;
	}
		
	

}
