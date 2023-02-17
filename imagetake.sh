# tool for copying text from pictures
# require spectacle (kde screenshot tool)
# and openCV things idk (TODO)

spectacle -rbn -o /tmp/imtotext.png

STRP="import pytesseract
import cv2
import matplotlib.pyplot as plt
from PIL import Image
image = cv2.imread(\"/tmp/imtotext.png\")
string = pytesseract.image_to_string(image)
print(string)"

qdbus org.kde.klipper /klipper setClipboardContents "$(python -c "$STRP" )"
