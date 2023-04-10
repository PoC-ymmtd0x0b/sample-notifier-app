# frozen_string_literal: true

module MetaTagsHelper
  def default_meta_tags
    {
      site: 'Sample App',
      reverse: true,
      charset: 'utf-8',
      description: '学習用のサンプルアプリ',
      viewport: 'width=device-width, initial-scale=1.0',
      og: {
        title: :title,
        type: 'website',
        site_name: 'sample app',
        description: :description,
        image: 'http://localhost:3000/ogp/ogp.png',
        url: 'http://localhost:3000'
      },
      twitter: {
        card: 'summary',
        site: '@sampleapp',
        description: :description,
        image: 'http://localhost:3000/ogp/ogp.png',
        domain: 'http://localhost:3000'
      }
    }
  end
end
