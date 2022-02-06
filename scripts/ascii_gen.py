import PIL.Image
import time
import os


ASCII_CHARS = [" ", "■", "■"]


def to_greyscale(image):
    return image.convert("L")


def resize(image, new_height):
    width, height = image.size
    new_width = new_height * width / height
    return image.resize((int(new_width), int(new_height)))


def pixel_to_ascii(image):
    pixels = image.getdata()
    ascii_str = ""
    for pixel in pixels:
        ascii_str += ASCII_CHARS[pixel//128]
    return ascii_str


def main():
    rows, columns = os.popen('stty size', 'r').read().split()

    for i in range(1, 6573):

        path = "../frames/frame-" + f"{i:04d}" + ".jpg"
        try:
            image = PIL.Image.open(path)
        except:
            print(path, "Unable to find image ")

        image = resize(image, int(rows))

        greyscale_image = to_greyscale(image)
        ascii_str = pixel_to_ascii(greyscale_image)
        img_width = greyscale_image.width
        ascii_str_len = len(ascii_str)
        ascii_img = ""

        greyscale_image = to_greyscale(image)
        ascii_str = pixel_to_ascii(greyscale_image)
        for i in range(0, ascii_str_len, img_width):
            ascii_img += ascii_str[i:i+img_width] + "\n"
        time.sleep(0.750)
        print(ascii_img)


main()

