// See the Tailwind configuration guide for advanced usage
// https://tailwindcss.com/docs/configuration

const plugin = require("tailwindcss/plugin")
const fs = require("fs")
const path = require("path")

module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/track24_assesment_web.ex",
    "../lib/track24_assesment_web/**/*.*ex"
  ],
  theme: {
    extend: {
      fontFamily: {
        'heading': ['Inter'],
        'body': ['Inter']
      },
      colors: {
        'track24-blue': {
          '100': '#E3EFF3',
          '200': '#BAD8DE',
          '300': '#2F545D'
        },
        'track24-green': {
          '100': '#E7EED9',
          '200': '#C6D6A9',
          '300': '#3C4B29'
        },
        'track24-red': {
          '100': '#F6EAEA',
          '200': '#E6BCBC',
          '300': '#643A3A'
        },
        'track24-yellow': {
          '100': '#F8F2DE',
          '200': '#EDDCA1',
          '300': '#55471B'
        },
        'track24-primary': {
          '300': '#395F65',
          '400': '#2C4B51'
        },
        'track24-secondary': {
          '200': '#96FDE7'
        },
        'track24-neutral': {
          '0': '#FFFFFF',
          '10': '#FAFAFA',
          '20': '#F4F5F5',
          '30': '#E9ECEC',
          '40': '#D8DFDF',
          '50': '#C9D4D4',
          '400': '#4E696A',
          '500': '#425F61',
          '600': '#325153',
          '800': '#193C3E',
          '900': '#152C2E'
        },
        'track24-light': '#BFD9CA',
        'track24-highlight': '#E4F4EB'
      },
      width: {
        '1/7': '14.2857143%',
        '2/7': '28.5714286%',
        '3/7': '42.8571429%',
        '4/7': '57.1428571%',
        '5/7': '71.4285714%',
        '6/7': '85.7142857%',
        '1/8': '12.5%',
        '2/8': '25%',
        '3/8': '37.5%',
        '4/8': '50%',
        '5/8': '62.5%',
        '6/8': '75%',
        '7/8': '86.5%',
        'screen-4/5': '80vh',
        'screen-9/10': '90vw'
      },
      height: {
        'screen-2/3': '66vh',
        'screen-4/7': '57vh',
        'screen-4/5': '80vh',
        'screen-1/2': '50vh'
      },
      keyframes: {
        'swing': {
          '0%,100%': { transform: 'rotate(25deg)' },
          '50%': { transform: 'rotate(-25deg)' },
        }
      },
      animation: {
        'swing': 'swing 1s infinite'
      }
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    // Allows prefixing tailwind classes with LiveView classes to add rules
    // only when LiveView classes are applied, for example:
    //
    //     <div class="phx-click-loading:animate-ping">
    //
    plugin(({addVariant}) => addVariant("phx-click-loading", [".phx-click-loading&", ".phx-click-loading &"])),
    plugin(({addVariant}) => addVariant("phx-submit-loading", [".phx-submit-loading&", ".phx-submit-loading &"])),
    plugin(({addVariant}) => addVariant("phx-change-loading", [".phx-change-loading&", ".phx-change-loading &"])),

    // Embeds Heroicons (https://heroicons.com) into your app.css bundle
    // See your `CoreComponents.icon/1` for more information.
    //
    plugin(function({matchComponents, theme}) {
      let iconsDir = path.join(__dirname, "../deps/heroicons/optimized")
      let values = {}
      let icons = [
        ["", "/24/outline"],
        ["-solid", "/24/solid"],
        ["-mini", "/20/solid"],
        ["-micro", "/16/solid"]
      ]
      icons.forEach(([suffix, dir]) => {
        fs.readdirSync(path.join(iconsDir, dir)).forEach(file => {
          let name = path.basename(file, ".svg") + suffix
          values[name] = {name, fullPath: path.join(iconsDir, dir, file)}
        })
      })
      matchComponents({
        "hero": ({name, fullPath}) => {
          let content = fs.readFileSync(fullPath).toString().replace(/\r?\n|\r/g, "")
          let size = theme("spacing.6")
          if (name.endsWith("-mini")) {
            size = theme("spacing.5")
          } else if (name.endsWith("-micro")) {
            size = theme("spacing.4")
          }
          return {
            [`--hero-${name}`]: `url('data:image/svg+xml;utf8,${content}')`,
            "-webkit-mask": `var(--hero-${name})`,
            "mask": `var(--hero-${name})`,
            "mask-repeat": "no-repeat",
            "background-color": "currentColor",
            "vertical-align": "middle",
            "display": "inline-block",
            "width": size,
            "height": size
          }
        }
      }, {values})
    })
  ]
}
