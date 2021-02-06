int setu[] = { -9, 8, 2, 3, 4, 5, 6, 7, 1, 9};
	
	int arr0[] = {-3, 0,1,2,-1};
	int arr1[] = {-2, 2,3,-1};
	int arr2[] = {-4, 3,4,5,6,-1};
	int arr3[] = {-3, 6, 7, 8,-1};
	int arr4[] = {-3, 3, 5, 7,-1};
	int arr5[] = {-3, 4, 6, 8,-1};
	int arr6[] = {-3, 1, 2, 9,-1};
	int arr7[] = {-3, 3, 4, 5,-1};
	int arr8[] = {-3, 9, 10, 1,-1};
	int arr9[] = {-6, 7, 3, 4, 5, 6, 2,-1};
	
	int *arr[]={arr0,arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8,arr9};
	


int main()
{
	
	
	for(int k=0;k<10;++k)
	{
		intersection(arr[k],setu);
	}
	
		sort(arr);
		

 int i[20];
 int index=0;
int flag1=0;
 for(int k=0;k<10;++k)
	{
		for(int j=1;j<(((arr[k])[0])*-1)+1;++j)
		{	
				if(((setu[0]*-1)+1)==index)
				{
						break;
				}
				
				for(int m=1;m<(setu[0]*-1)+1;++m)
				{
					if((arr[k])[j]==setu[m])
					{
						i[index]=(arr[k])[j];
						index++;
						setu[m]*=-1;
						flag1=1;
						continue;
					}	
					
				}
				
		}
		if(flag1==1)
		{
			printarr(arr[k]);
			flag1=0;
		}
	}
 

}	
	
void intersection(int *s,int *u)
{
	int count=0;
	
	for(int i=1;i<=(u[0]*-1);++i)
	{
		for(int j=1;j<=(s[0]*-1);++j)
		{
			if(u[i]==s[j])
				++count;	
		}	
	}
	
	s[(s[0]*-1)+1]=count;
}





 

void sort(int **s)
 {
 for (int i = 0; i < (10- 1); ++i)
 {
      for (int j = 0; j < 10 - 1 - i; ++j )
      {
		
           if ( (s[j])[(((s[j])[0])*-1)+1]  < (s[j+1])[(((s[j+1])[0])*-1)+1])
           {	
			   
		
			   int *temp = s[j];
				s[j] = s[j+1];
				s[j+1] = temp;
           }
      }
	 
 }
 } 

 
 void printarr(int *a)
 {
		for(int j=1;j<(a[0]*-1)+1;++j)
		{	
		print(a[j]);
		}
	 print("\n"); 
 }
 

