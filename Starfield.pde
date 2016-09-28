Particle [] particle = new Particle[300];
void setup()
{
	size(400,400);
	for(int i=0; i<particle.length; i++)
	{
		particle[i] = new NormalParticle();
	}
	particle[0] = new OddballParticle();
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
class NormalParticle implements Particle
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
	public void move()
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
	public void show()
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
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	int myColor, time, direction;
	double myX, myY, size;
	OddballParticle()
	{
		myX = 200;
		myY = 200;
		myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		direction = 0;
		size = 10;
		time = 0;
	}
	public void move()
	{
		myX = .5*time*Math.cos(time*Math.PI/180 - 200) + 200;
		myY = .5*time*Math.sin(time*Math.PI/180 - 200) + 200;
		if(time > 600)
			direction = 1;
		else if(time < -600)
			direction = 0;

		if(direction == 0)
			time++;
		else
			time--;
	}
	public void show()
	{
		fill(myColor);
		ellipse((float)myX,(float)myY,(float)size,(float)size);
	}
}

class JumboParticle //uses inheritance
{
	//your code here
}

