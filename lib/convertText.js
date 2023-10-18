const fs = require("fs-extra");
const convert = require("cyrillic-to-latin");
const { simplified } = require("zh-convert");

async function convertSerbianCyrillicToLatin(filePath) {
  let data = await fs.readFile(filePath, "utf-8");
  let latinCharactersText = convert(data);
  await fs.writeFile(filePath, latinCharactersText, "utf-8");
}

async function convertChineseTraditionalToSimplified(filePath) {
  let data = await fs.readFile(filePath, "utf-8");
  let simplifiedText = simplified(data);
  await fs.writeFile(filePath, simplifiedText, "utf-8");
}

module.exports = {
  convertSerbianCyrillicToLatin,
  convertChineseTraditionalToSimplified,
};
