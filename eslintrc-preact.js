module.exports = {
  'env': {
    'browser': true,
    'es6': true,
    'node': true
  },
  'extends': 'eslint:recommended',
  'parser': 'babel-eslint',
  'parserOptions': {
    'ecmaFeatures': {
      'experimentalObjectRestSpread': true,
      'jsx': true
    },
    'sourceType': 'module'
  },
  'plugins': [
    'react'
  ],
  'settings': {
    'react': {
      'pragma': 'h'
    }
  },
  'rules': {
    'indent': [
      'warn',
      2,
      { "SwitchCase": 1 }
    ],
    'linebreak-style': [
      'error',
      'unix'
    ],
    'quotes': [
      'error',
      'double'
    ],
    'semi': [
      'error',
      'always'
    ],
    'no-console': 'warn',
    'no-unused-vars': 'warn',
    'react/jsx-uses-react': 'error',
    'react/jsx-uses-vars': 'error'
  }
};
