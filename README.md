# Docker image for kraken (OCR engine for all languages)

Original source: https://github.com/mittagessen/kraken

## Run the image

You can start the container outside of Galaxy with:

```bash
docker run -it --rm quay.io/leistivo/kraken-ocr:7.0.2 bash 
```
## Test basic functionalities (binarisation & segmentation)

You can test it outside of Galaxy as follows:

### Create an example file

```bash
mkdir -p test &&
convert -size 1600x500 xc:white -depth 8 -type TrueColor \
  -font /usr/share/fonts/truetype/dejavu/DejaVuSerif.ttf \
  -pointsize 46 -fill black -annotate +80+180 \
  "Bonjour, ceci est un test de Kraken." \
  test/french.png
```
### Run kraken 

```bash
docker run -it --rm -v ./test:/test quay.io/leistivo/kraken-ocr:7.0.2 \
  kraken -i /test/french.png /test/out.json binarize segment
```
