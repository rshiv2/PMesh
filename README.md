# PMesh

I wasn't really sure what to name this project, but P(rocessing)Mesh sounded about right. I saw a post on [r/processing](https://www.reddit.com/r/processing/comments/rhtyfq/elastic_type_the_copenhagen_series/?utm_source=share&utm_medium=web2x&context=3) that had a grid of rectangles. Each rectangle would expand depending on its distance from the cursor. I first saw this post at 2AM and my brain was not powerful enough to comprehend what I was watching, so I figured I would try to code it up the following day. Turned out to be a cool little project!

Anyway, I decided to name my grid a PMesh. Each row of rectangles is called a Chain, and each rectange within a row is called a Link. I went with this naming convention because the final result sort of reminded me of [chainmail](https://www.google.com/search?q=chainmail&sxsrf=AOaemvKCx4WC3Q4Q8I3eqSU_RsQqn3SEHQ:1640212058454&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjuheaIuvj0AhUdIDQIHRC7DowQ_AUoAnoECAIQBA&biw=1477&bih=716&dpr=1.8), since the size of one rectangle would affect the positions of the other rectangles in the grid, kind of like how the contraction / expansion of one link in a chainmail will affect the positions of other links.

As a slight modification to the original Reddit post, I made each Link *contract* rather than expand as the mouse gets closer to it. I also added a slight alpha-gradient to the Links' color. This way, Links look kind of transparent when the mouse is far from them, but become fully opaque as the mouse gets closer to them. 

## Setup
To run this code, you'll have to install the [Processing IDE](https://processing.org/download). From there, you can just clone this repository with
```git clone https://github.com/rshiv2/PMesh.git``` and run the code. I've left some parameters in ```PMesh.pde``` for users to play around with. Hopefully the comments I've left will provide a good idea of what each of these parameters does!
