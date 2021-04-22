const fs = require('fs');
//@ts-check

let obj = { "score": 30.0 }

const { firefox } = require('playwright-firefox');

(async () => {
    const browser = await firefox.launch();
    const page = await browser.newPage();
    await page.goto('http://0.0.0.0:8000/');

    fs.appendFile('../results/results.json', JSON.stringify(obj), (err)=>{
        if (err) throw console.error(err);
        console.log('Saved')
    })

    await page.screenshot({ path: `example.png` });
    await browser.close();
  })();