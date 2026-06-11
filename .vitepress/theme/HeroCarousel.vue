<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue'
import { withBase } from 'vitepress'

const images = [
  { src: withBase('/assets/logo.svg'), alt: 'TI Planning Tool', isLogo: true },
  { src: withBase('/assets/carousel/privacy.png'), alt: 'TI Planning Tool Dashboard', isLogo: false },
  { src: withBase('/assets/carousel/anonymization.png'), alt: 'Personalized Head Models', isLogo: false },
  { src: withBase('/assets/carousel/tip_ui_1.png'), alt: 'Electromagnetic Simulation', isLogo: false },
  { src: withBase('/assets/carousel/tip_ui_2.png'), alt: 'Electrode Selector', isLogo: false },
  { src: withBase('/assets/carousel/e_fields.png'), alt: 'Post-Processing Analysis', isLogo: false },
]

const current = ref(0)
const paused = ref(false)
let timer: ReturnType<typeof setInterval> | null = null

function goTo(i: number) {
  current.value = i
}

function next() {
  if (!paused.value) {
    current.value = (current.value + 1) % images.length
  }
}

onMounted(() => {
  timer = setInterval(next, 4000)
})

onUnmounted(() => {
  if (timer) clearInterval(timer)
})
</script>

<template>
  <div
    class="hero-carousel"
    @mouseenter="paused = true"
    @mouseleave="paused = false"
  >
    <div class="carousel-track">
      <div
        v-for="(img, i) in images"
        :key="img.src"
        class="carousel-slide"
        :class="{ active: i === current }"
      >
        <div v-if="img.isLogo" class="logo-glow" />
        <img
          :src="img.src"
          :alt="img.alt"
          :class="img.isLogo ? 'logo-img' : 'screenshot-img'"
        />
      </div>
      <div class="edge-fade" />
    </div>
    <div class="carousel-dots">
      <button
        v-for="(_, i) in images"
        :key="i"
        class="dot"
        :class="{ active: i === current }"
        @click="goTo(i)"
        :aria-label="`Slide ${i + 1}`"
      />
    </div>
  </div>
</template>

<style scoped>
.hero-carousel {
  position: relative;
  width: 100%;
  max-width: 480px;
}

.carousel-track {
  position: relative;
  width: 100%;
  aspect-ratio: 16 / 10;
  border-radius: 10px;
  overflow: hidden;
}

.carousel-slide {
  position: absolute;
  inset: 0;
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.8s ease;
}

.carousel-slide.active {
  opacity: 1;
}

/* ── Logo slide ── */
.logo-glow {
  position: absolute;
  top: 50%;
  left: 50%;
  width: 220px;
  height: 220px;
  border-radius: 50%;
  background-image: linear-gradient(135deg, rgba(1, 144, 208, 0.5) 0%, rgba(20, 196, 176, 0.3) 100%);
  filter: blur(56px);
  transform: translate(-50%, -50%);
}

.logo-img {
  position: relative;
  width: 192px;
  height: 192px;
  object-fit: contain;
  z-index: 1;
}

/* ── Screenshot slides ── */
.screenshot-img {
  position: absolute;
  inset: 0;
  width: 100%;
  height: 100%;
  object-fit: contain;
}

/* ── Soft edge overlay ── */
.edge-fade {
  position: absolute;
  inset: 0;
  pointer-events: none;
  z-index: 2;
  box-shadow: inset 0 0 48px 24px var(--vp-c-bg);
}

/* ── Dots ── */
.carousel-dots {
  display: flex;
  justify-content: center;
  gap: 6px;
  padding-top: 10px;
}

.dot {
  width: 7px;
  height: 7px;
  border-radius: 50%;
  background: var(--vp-c-divider);
  border: none;
  cursor: pointer;
  padding: 0;
  transition: background 0.2s ease, transform 0.2s ease;
}

.dot.active {
  background: var(--vp-c-brand-1);
  transform: scale(1.4);
}
</style>
