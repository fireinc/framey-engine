module Framey
  module VideosHelper
    # This method renders the Framey video recorder from within an ActionView in your Rails app.
    #
    # Example Usage (assuming ERB):
    #    <%= javascript_include_tag "swfobject" %>
    #    <%= render_recorder({
    #      :id => "[some id]"               # the id of the flash embed object (optional, random by default)
    #      :max_time => 60,                 # maximum allowed video length in seconds (optional, defaults to 30)
    #      :session_data => {               # custom parameters to be passed along to your app later (optional)
    #        :user_id => <%= @user.id %>    # you may, for example, want to relate this recording to a specific user in your system
    #      }
    #    }) %>
    def render_recorder(opts={})
      api_key = Framey::API_KEY
      timestamp, signature = Framey::Api.sign
      session_data = (opts[:session_data]||{}).map { |k,v| "#{k.to_s}=#{v.to_s}" }.join(",")
      run_env = Framey::RUN_ENV
      max_time = opts[:max_time] || Framey::MAX_TIME
      divid = "frameyRecorderContainer_#{(rand*999999999).to_i}"
      objid = opts[:id] || "the#{divid}"
      
raw <<END_RECORDER
  <div id="#{divid}"></div>
  <script type="text/javascript">
  var flashvars = {
  	api_key: "#{api_key}",
  	signature: "#{signature}",
  	time_stamp: "#{timestamp}",
  	session_data: "#{session_data}",
  	run_env: "#{run_env}",
  	max_time: "#{max_time.to_s}"
  };
  var params = {
    'allowscriptaccess': 'always',
    "wmode": "transparent"
  };
  var attributes = {
    'id': "#{objid}",
    'name': "#{objid}"
  };
  swfobject.embedSWF("/recorder.swf", "#{divid}", "340", "340", "8", "", flashvars, params, attributes);
  </script>
END_RECORDER
    end
    
    
    # This method renders the Framey video player from within an ActionView in your Rails app.
    #
    # Example Usage (assuming ERB):
    #    <%= javascript_include_tag "swfobject" %>
    #    <%= render_player({
    #      :video_url => "[video url]",          # the video url received in the callback (required)
    #      :thumbnail_url => "[thumbnail url]",  # the thumbnail url received in the callback (required)
    #      :progress_bar_color => "0x123456",    # the desired color for the progress bar (optional, defaults to black)
    #      :volume_bar_color => "0x123456",      # the desired color for the volume bar (optional, defaults to black)
    #      :id => "[some id]"                    # the id of the flash embed object (optional, random by default)
    #    }) %>
    def render_player(opts={})
      video_url = opts[:video_url] || "#{Framey::API_HOST}/videos/#{opts[:video_name]}/source.flv"
      thumbnail_url = opts[:thumbnail_url] || "#{Framey::API_HOST}/videos/#{opts[:video_name]}/thumbnail.jpg"
      
      divid = "frameyPlayerContainer_#{(rand*999999999).to_i}"
      objid = opts[:id] || "the#{divid}"
      
      progress_bar_color = "#{opts[:progress_bar_color]}"
      volume_bar_color = "#{opts[:volume_bar_color]}"
      
raw <<END_PLAYER
      <div id="#{divid}"></div>
      <script type="text/javascript">
      var flashvars = {
        'video_url': "#{video_url}",
        'thumbnail_url': "#{thumbnail_url}",
        "progress_bar_color": "#{progress_bar_color}",
        "volume_bar_color": "#{volume_bar_color}"
      };

      var params = {
        'allowfullscreen': 'true',
        'allowscriptaccess': 'always',
        "wmode": "transparent"
      };

      var attributes = {
        'id': "#{objid}",
        'name': "#{objid}"
      };

      swfobject.embedSWF("/player.swf", "#{divid}", '340', '290', '9', 'false', flashvars, params, attributes);
      </script>
END_PLAYER
    end
  end
end