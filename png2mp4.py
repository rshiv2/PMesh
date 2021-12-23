import os
import sys
import cv2
import numpy as np


fourcc = cv2.VideoWriter_fourcc(*"mp4v")
fps = 30.0
dim = (640, 400)
vid = cv2.VideoWriter('pmesh.mp4', fourcc=fourcc, fps=fps, frameSize = dim);

images = ['images/' + img for img in os.listdir('./images') if img.split('.')[-1] == "png"]
num_images = len(images);


for i in sorted(images):
    if not os.path.isfile(i):
        print(f"File {i} does not exist")
        continue

    img = cv2.imread(i, flags = cv2.IMREAD_COLOR)

    if img is None:
        print(f"Failed to retrieve img {i}")
    
    vid.write(img)

vid.release()

print(f"Number of images in directory: {num_images}")

