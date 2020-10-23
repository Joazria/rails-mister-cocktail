import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Create Amazing Cocktails", "Drinks & Party at home"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
