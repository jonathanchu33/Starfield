Particle [] particles = new Particle[300];
void setup()
{
	size(400,400);
	for(int i=0; i<particles.length; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[particles.length-2] = new JumboParticle();
	particles[particles.length-1] = new OddballParticle();
}
void draw()
{
	background(0);
	for(int i=0; i<particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}

class NormalParticle implements Particle
{
	int myColor;
	double myX, myY, speed, angle, size;
	NormalParticle()
	{
		myX = mouseX;
		myY = mouseY;
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
			myX = mouseX;
			myY = mouseY;
			angle = Math.random()*2*Math.PI;
		}
		size = (Math.sqrt((myX-mouseX)*(myX-mouseX) + (myY-mouseY)*(myY-mouseY)))/50 + 1;
	}
	public void show()
	{
			fill(myColor);
			ellipse((float)myX,(float)myY,(float)size,(float)size);
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
		size = 15;
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
		if(time > 600)
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		else if(time < -600)
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		fill(myColor);
		rect((float)myX,(float)myY,(float)size,(float)size);
	}
}
class JumboParticle extends NormalParticle
{
	void move()
	{
		myX += speed * Math.cos(angle);
		myY += speed * Math.sin(angle);
		if(myX > 600 || myX < -200 || myY > 600 || myY < -200)
		{
			myX = mouseX;
			myY = mouseY;
			angle = Math.random()*2*Math.PI;
			myColor = color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
		}
		size = (Math.sqrt((myX-mouseX)*(myX-mouseX) + (myY-mouseY)*(myY-mouseY)))/5 + 1;
	}
}

