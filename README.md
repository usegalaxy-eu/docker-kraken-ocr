# Docker image for kraken (OCR engine for all languages)

Original source: https://github.com/mittagessen/kraken

### Run the image

You can start the container outside of Galaxy with:

```bash
docker run -it --rm quay.io/leistivo/kraken-ocr:7.0 bash 
```

### Test binarisation and segmentation

You can test basic functionalities outside of Galaxy with:

```bash
docker run -it --rm -v ./test:/test quay.io/leistivo/kraken-ocr:7.0 kraken -i /test/french.png /test/out.json binarize segment
```
