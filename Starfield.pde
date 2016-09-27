NormalParticle [] particle = new NormalParticle[300];
void setup()
{
	size(400,400);
	for(int i=0; i<particle.length; i++)
	{
		particle[i] = new NormalParticle();
	}
}
void draw()
{
	background(0);
	for(int i=0; i<particle.length; i++)
	{
		particle[i].show();
		particle[i].move();
	}
}
class NormalParticle
{
	int myColor;
	double myX, myY, speed, angle, size;
	NormalParticle()
	{
		myX = 200;
		myY = 200;
		speed = Math.random()*5+1;
		angle = Math.random()*2*Math.PI;
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		size = 1;
	}
	void move()
	{
		myX += speed * Math.cos(angle);
		myY += speed * Math.sin(angle);
		if(myX > 400 || myX < 0 || myY > 400 || myY < 0)
		{
			myX = 200;
			myY = 200;
		}
		size = (Math.sqrt((myX-200)*(myX-200) + (myY-200)*(myY-200)))/50 + 1;
	}
	void show()
	{
		//if(Math.sqrt((myX-200)*(myX-200) + (myY-200)*(myY-200)) > 20)
		//{
			fill(myColor);
			ellipse((float)myX,(float)myY,(float)size,(float)size);
		//}
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

