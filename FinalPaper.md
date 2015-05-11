At first, I don’t think my work could be called a IT project, it’s not really an application, but a knowledge, or I’d rather calls it an innovation. In this paper, I’d talk more about it.  
In the presentation, I introduced 2 algorithms about prime numbers, which are:
-	Prime-checking: check if a given number n is prime or composite.
-	Prime-filtering: Determine all the prime numbers which are not greater than the given positive n.
-	Miller–Rabin primality test: this algorithm require Abstract algebra knowledge to understand how it work. But the point is this algorithm can’t guarantee the correctness perfectly. It only has  very high probability of correctness.
Now I’d talk more about the application and how these algorithms inspired  me a lot.
Prime-checking is naturally a brute-force, which runs very slowly. But after some observe: 

![alt text](http://i.imgur.com/tZrMUQF.gif "Formular1")

It really cut down lot of running time, ![alt text](http://i.imgur.com/5Z3VwCJ.gif "sqrtn")  faster than the orginal. Isn’t that great? 


About Prime-filtering, there’s a reallly interesting problem in [SPOJ](http://www.spoj.com):     [http://www.spoj.com/problems/PRIME1/
](http://www.spoj.com/problems/PRIME1/)

![alt text](http://i.imgur.com/bOPtsE3.png "Problem")

#Analysis

This problem is very similar to the Prime-filtering, but the difference is Prime-filtering used for 1…n, and the PRIME1 needs m..n.  
m <= n <= 10^9 is too big, but we are given an advantage that  n-m<=10^5.
- The idea is first we determine all prime number less than  , call it as set P. 
- Then we’d do a second filltering, (a  bit different from the original Prime-filtering):
--	We know that if a number x in range [m,n]  is a composite, then   must have a divisor in P.
--	Then we’d clear all composite number  range [m,n] by clearing all multiple of every element in P.
---	That is, for every x in P, we’d set all number y=kx as a composite (not prime), where   < Max(m/x, 2) <= k <= n/x

# Solution code
##My accepted C++ code in spoj:
``` csharp
#include <cstdio>
#include <iostream>
#include <vector>
#include <cstring>
#define maxbaseprime 320000
using namespace std;
bool isP[maxbaseprime];     vector <int> p; int nP;
void init(){
    p.clear();          memset(isP,true,sizeof(isP));
    isP[0]=false;   isP[1]=false;
    int i,j;
    for (i=2;i<maxbaseprime;i++)
        if (isP[i]==true){
            for (j=2;(i*j)<maxbaseprime;j++)
                isP[i*j]=false;
            p.push_back(i);
        }
    nP=p.size();
};
void primeinrange(int l,int r){
    memset(isP,true,sizeof(isP));
    if (l<2)l=2;            int i,j,x;
    for (i=0;i<nP;i++){
        x=p[i];
        j=x*x;
        if (j<l) j=x*((l+x-1)/x);
        if (r<j) break;
        while (j<=r){
            isP[j-l]=false;
            j+=x;
        }
    }
    for (i=l;i<=r;i++) if (isP[i-l]==true) cout<<i<<"\n";
}
int main(){
	ios::sync_with_stdio(false);		init();
    int test,ntest;     cin >> ntest;
    int n,m;
    for (test=0;test<ntest;test++){
        cin >> m >> n;
        if (test>0) cout<<"\n";
        primeinrange(m,n);
    }
    return 0;
}
```
## Java code version:
```java
import java.util.*;
import java.io.*;
public class Main{
	static Scanner reader;
	static ArrayList <Integer> P;
	static final int maxN = 1000000000;
	
	static void init(){
		P = new ArrayList <Integer> ();
		int maxP = (int) Math.sqrt( maxN + 2.0 );
		boolean d[]=new boolean [maxP+2];
		Arrays.fill(d, true);
		d[0]=false; d[1]=false;
		int i,j;
		P.clear();
		for (i=2;i<=maxP;i++) if (d[i]==true){
			P.add(i);
			for (j=i;(i*j)<=maxP;j++) d[i*j]=false;
		}
	}
	
	static void primeinRange(int m,int n){
		m=Math.max(m, 2);
		if (n<m) return;
		int len = n - m + 1;
		boolean d[] = new boolean [len];
		Arrays.fill(d, true);
		int i,x,y;
		for (i=0;i<P.size();i++){
			x=P.get(i); 
			if (x>n) break;
			y=Math.max(2, (int)((m+(x-1))/x))*x;
			while (y<=n){
				d[ y - m ]=false;
				y += x;

			}
		}
		for (i=0;i<len;i++) if (d[i]==true){
			System.out.println((i+m));
		}
	}
    public static void main( String[] args )throws Exception{
    	reader=new Scanner(System.in);
    	init();
    	int t=reader.nextInt(); int n,m;
    	for (int i=0;i<t;i++){
    		m=reader.nextInt();
    		n=reader.nextInt();
    		
    		if (i>0) System.out.println("");
    		primeinRange(m, n);
    	}
    }
}
```


So, we’ve gone through another problem about filtering. 

# Why I chose this “project”
Well if I had more time, and not spent too much efforts on AITP competition, then I could have done a better project. I could have keep up better with classes. I intended to do a bigger scale project using rails. Something like a webpage including mini-games teaching Math and IT for kids. Something like what I did on the my presentation in Math 2008. But I didn’t have much time left to do all of that. So I choose this as my presentation, which I’m most confident in.
# What I’ve learnt from our class:
I’ve learnt lots of technique from our class. Ruby, html, css, Ruby on rails,… but sadly, I couldn’t use them as my project due to my rushed time in a semester 17 credit hours in total.

Anyway, be happy with the day after mother day, because the word count from MS.word hit over 700.

![alt text](https://lansingchurch.files.wordpress.com/2014/02/1723893-875275-firework-streaks-in-night-sky-celebration-background.jpg "celebration")


Thank you! dr.Im! 
