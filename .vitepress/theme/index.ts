import { h } from 'vue'
import DefaultTheme from 'vitepress/theme'
import type { Theme } from 'vitepress'
import './custom.css'
import HeroCarousel from './HeroCarousel.vue'

export default {
  extends: DefaultTheme,
  Layout() {
    return h(DefaultTheme.Layout, null, {
      'home-hero-image': () => h(HeroCarousel)
    })
  },
  enhanceApp({ app, router }) {
    // Image zoom on click
    if (typeof window !== 'undefined') {
      const addZoom = () => {
        document.querySelectorAll('.vp-doc img').forEach((img: Element) => {
          if (img.getAttribute('data-zoom-attached')) return
          img.setAttribute('data-zoom-attached', 'true')
          img.addEventListener('click', () => {
            const overlay = document.createElement('div')
            overlay.style.cssText = 'position:fixed;inset:0;background:rgba(0,0,0,0.85);display:flex;align-items:center;justify-content:center;z-index:9999;cursor:zoom-out;backdrop-filter:blur(4px);animation:fadeIn .2s ease'
            const clone = img.cloneNode(true) as HTMLElement
            clone.style.cssText = 'max-width:90vw;max-height:90vh;border-radius:8px;box-shadow:0 20px 60px rgba(0,0,0,0.5);object-fit:contain;cursor:zoom-out'
            overlay.appendChild(clone)
            overlay.addEventListener('click', () => {
              overlay.style.opacity = '0'
              overlay.style.transition = 'opacity .15s ease'
              setTimeout(() => overlay.remove(), 150)
            })
            document.body.appendChild(overlay)
          })
        })
      }

      router.onAfterRouteChanged = () => {
        setTimeout(addZoom, 100)
      }

      // Initial page
      if (document.readyState === 'complete') {
        setTimeout(addZoom, 100)
      } else {
        window.addEventListener('load', () => setTimeout(addZoom, 100))
      }
    }
  }
} satisfies Theme
