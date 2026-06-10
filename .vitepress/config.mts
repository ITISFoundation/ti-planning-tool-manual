import { defineConfig } from 'vitepress'

export default defineConfig({
  title: 'TIP Manual',
  description: 'User manual for the TI Planning Tool (TIP)',
  base: '/ti-planning-tool-manual/',
  ignoreDeadLinks: [
    /\/uploads\//
  ],
  appearance: 'dark',
  lastUpdated: true,

  markdown: {
    math: true
  },

  head: [
    ['link', { rel: 'icon', href: '/assets/favicon-tis.png' }],
    ['link', { rel: 'preconnect', href: 'https://fonts.googleapis.com' }],
    ['link', { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' }],
    ['link', { href: 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap', rel: 'stylesheet' }]
  ],

  themeConfig: {
    logo: '/assets/logo.svg',
    siteTitle: 'TIP Manual',

    outline: {
      level: [2, 3],
      label: 'On this page'
    },

    nav: [
      { text: 'Quick Start', link: '/docs/plan/start' },
      { text: 'Background', link: '/docs/background/background' },
      { text: 'Workflows', link: '/docs/plan/workflows' },
      { text: 'IT\'IS', link: 'https://itis.swiss/' },
      { text: 'YouTube', link: 'https://youtube.com/playlist?list=PLcJQYcVCSqDu5gXnJj-_vS_spGhZOe-jF&si=9W-fHPf3MYl4fXCn' },
    ],

    sidebar: [
      {
        text: 'Welcome',
        link: '/index',
        items: [
          { text: 'Why offer a TI Planning Tool?', link: '/docs/welcome/what_is_ti_planning_tool' },
          { text: 'TIP.lite', link: '/docs/welcome/tip-vs-tip-lite' },
        ]
      },
      {
        text: 'Background',
        link: '/docs/background/background',
        items: [
          { text: 'Planning Steps', link: '/docs/background/modeling_steps' },
          { text: 'TI modes', link: '/docs/background/modes' },
          {
            text: 'Electromagnetic Modeling',
            link: '/docs/background/electromagnetic_modeling',
            items: [
              { text: 'Head Models', link: '/docs/material_methods/anatomical_refs' },
              { text: 'Electrode Shapes and Placement', link: '/docs/material_methods/electrode_models' },
              { text: 'Electromagnetic (EM) Simulator', link: '/docs/material_methods/em_sim' },
              { text: 'Dielectric Tissue Properties', link: '/docs/material_methods/dielectric_properties' },
              { text: 'Boundary Conditions', link: '/docs/material_methods/boundary_cond' },
              { text: 'Discretization', link: '/docs/material_methods/grid_settings' },
            ]
          },
          { text: 'Quantities-of-Interest', link: '/docs/background/electromagnetic_modeling/quantities_of_interest' },
          { text: 'Multi-Goal Optimization', link: '/docs/background/multi_goal_optimization' },
          { text: 'SuMo Optimizer', link: '/docs/background/sumo_optimizer' },
          { text: 'Hypervolume Indicator', link: '/docs/background/hv_score' },
        ]
      },
      {
        text: 'Quick Start Guide',
        link: '/docs/plan/start',
        items: [
          {
            text: 'Platform Overview',
            link: '/docs/platform_introduction/platform',
            items: [
              { text: 'Landing Page', link: '/docs/platform_introduction/overview' },
              { text: 'Dashboard', link: '/docs/platform_introduction/dashboard' },
              { text: 'Data', link: '/docs/platform_introduction/data' },
              { text: 'Billing Center', link: '/docs/platform_introduction/billing_center' },
            ]
          },
          { text: 'Creating a New Plan', link: '/docs/plan/create_new_plan' },
          { text: 'Data Quality Requirements', link: '/docs/plan/data_quality_requirements' },
          {
            text: 'Workflows',
            link: '/docs/plan/workflows',
            items: [
              { text: 'Offline Personalization', link: '/docs/services/data_privacy' },
              { text: 'File Picker', link: '/docs/services/file_picker' },
              { text: 'Personalizer', link: '/docs/services/personalizer' },
              { text: 'Model Inspector', link: '/docs/services/fiducials_placement' },
              { text: 'Simulator', link: '/docs/services/simulator' },
              { text: 'TI Analysis', link: '/docs/services/post_processing' },
              { text: 'Exposure Analysis', link: '/docs/services/s4l_post_processing' },
            ]
          },
        ]
      },
      { text: 'References', link: '/docs/background/references' },
      {
        text: 'Licensing',
        link: '/docs/support/license',
        items: [
          { text: 'IT\'IS TIP', link: '/docs/support/itis/itis_tc' },
          { text: 'Sim4Life', link: '/docs/support/sim4life/copyright_Sim4Life' },
        ]
      },
      {
        text: 'Release Notes',
        link: '/docs/support/releases',
        items: [
          { text: 'Changelog', link: '/docs/support/changelog' },
          { text: 'Known Issues', link: '/docs/support/knownbugs' },
          { text: 'Research & Upcoming Functionality', link: '/docs/background/ongoing_research' },
        ]
      },
      { text: 'Support', link: '/docs/support/support' },
    ],

    socialLinks: [
      { icon: 'github', link: 'https://github.com/ITISFoundation/ti-planning-tool-manual' }
    ],

    search: {
      provider: 'local'
    },

    footer: {
      message: '<a href="https://itis.swiss/who-we-are/contact/" target="_blank">Contact IT\'IS</a> · <a href="https://itis.swiss" target="_blank">IT\'IS Website</a> · <a href="https://itis.swiss/who-we-are/" target="_blank">About IT\'IS</a>',
      copyright: '© IT\'IS Foundation'
    },

    docFooter: {
      prev: 'Previous',
      next: 'Next'
    }
  }
})
