int odd(int num)
{
	if(num%2==1)
	return 1;
	
	return 0;

}

int even(int num)
{
	if(num%2==0)
	{
		return 2;
	}
	return 0;

}

int prime(int num)
{
	if(num==2)
	{
		return 3;
	}
	else
	{
		int i=2;
		int check=1;
		while(i<(num/2+1))
		{
			if(num%i==0)
			{
				check=0;
				break;
			}
			i++;
		}
		if(check==1)
		return 3;
		
		return 0;
	}
}

int main()
{

	int num=25;
	int sum=odd(num)+even(num)+prime(num);

	switch(sum)
	{

		case 1:
		{
			if(prime(num+2))
			{
				num=num+2;
			}
			else
			{
				num=num-2;
			}
			break;
		}
		case 2:
		{
			num=num+1;
			break;

		}
		case 4:
		{
			num=num+1;
			break;
		}
		case 5:
		{
			num=num;
			break;

		}

	};

}

