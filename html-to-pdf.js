const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

(async () => {
  const htmlFile = process.argv[2];
  const outputFile = process.argv[3];

  if (!htmlFile || !outputFile) {
    console.error('Usage: node html-to-pdf.js <input.html> <output.pdf>');
    process.exit(1);
  }

  const browser = await puppeteer.launch();
  const page = await browser.newPage();

  const htmlPath = path.resolve(htmlFile);
  await page.goto('file://' + htmlPath, { waitUntil: 'networkidle0' });

  await page.pdf({
    path: outputFile,
    format: 'A4',
    margin: { top: '0.4in', right: '0.4in', bottom: '0.4in', left: '0.4in' },
    printBackground: true
  });

  await browser.close();
})();
