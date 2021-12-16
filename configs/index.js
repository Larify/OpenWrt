const fs = require('fs');
const targets = ['./Lean.feeds.conf', 'Lienol.feeds.conf'];

const handle = async (target) => {
  if (!fs.existsSync(target)) return;

  const config = fs.readFileSync(target, { encoding: 'utf-8' });

  let lines = config.split('\n').filter((line) => {
    return line.includes('is not set') || /[^\s]*\=[^\s]+(.*)/.test(line);
  });
  const lineSet = new Set();
  lines.forEach((line) => lineSet.add(line));

  lines = [...lineSet].sort((a, b) => {
    a = a.replace(/^#\s+/, '');
    b = b.replace(/^#\s+/, '');
    return a > b ? 1 : -1;
  });
  fs.writeFileSync(target, lines.join('\n'), { encoding: 'utf-8' });
};

targets.forEach(handle);
