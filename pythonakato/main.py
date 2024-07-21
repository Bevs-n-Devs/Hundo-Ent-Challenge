import os
from flask import Flask, render_template, request, jsonify
from flaskwebgui import FlaskUI
import ssl
from flask_sqlalchemy import SQLAlchemy
ssl.create_default_context = ssl._create_unverified_context

app = Flask(__name__)

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///hundo_database.sqlite3"
app.config["TRACK_MODIFICATIONS"] = True


db = SQLAlchemy(app)

# create database table to store questionnaire results
class Data(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    music_name = db.Column(db.String(50), nullable=False)
    genre_type = db.Column(db.String(50), nullable=False)
    artist_name = db.Column(db.String(80), nullable=False)
    date_time = db.Column(db.String(80), nullable=False)
    decoder = db.Column(db.String(300), nullable=False)
    encoder = db.Column(db.String(300), nullable=False)

    # yes/no questions
    tape_baked = db.Column(db.String(150), nullable=False)
    azimuth_adjusted = db.Column(db.String(150), nullable=False)
    tape_wound = db.Column(db.String(150), nullable=False)
    cwf_normalisation = db.Column(db.String(150), nullable=True)
    # multiple choice - append into long list for multiple choices
    tape_conditions = db.Column(db.String(150), nullable=False)
    audio_analysis = db.Column(db.String(150), nullable=False)
    tools_used = db.Column(db.String(100), nullable=False)
    processing = db.Column(db.String(300), nullable=False)
    security = db.Column(db.String(300), nullable=True)
    restoration = db.Column(db.String(300), nullable=True)
    conversion = db.Column(db.String(300), nullable=True)
    tektronix = db.Column(db.String(300), nullable=True)
    video = db.Column(db.String(300), nullable=True)
    workflow = db.Column(db.String(300), nullable=True)
    additional_comments = db.Column(db.Text, nullable=True)

with app.app_context():
    db.create_all()


@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == 'GET':
        return render_template("index.html")
    else:
        incomplete_form_error = 'Please complete this section of the form. Alt + Left Arrow to continue.'
        music_name = request.form.get('music_name')
        genre_type = request.form.get('genre_type')
        artist_name = request.form.get('artist_name')
        date_time = request.form.get('date_time')
        decoder = request.form.get('decoder')
        encoder = request.form.get('encoder')
        video_tools = request.form.get('video_tools')
        additional_comments = request.form.get('additional_comments')
        

        # if yes selected return str
        tape_baked = request.form.get('tape_baked')
        # if user selects 'yes' change answer to 'Tape baked prior to playback.'
        if tape_baked == 'Yes':
            tape_baked = 'Tape baked prior to playback.'

        azimuth_adjusted = request.form.get('azimuth_adjusted')
        # if user selects 'yes' chnage answer to 'Azimuth adjusted to content.'
        if azimuth_adjusted == 'Yes':
            azimuth_adjusted = 'Azimuth adjusted to content.'

        tape_wound = request.form.get('tape_wound')
        # if user select yes update answer
        if tape_wound == 'Yes':
            tape_wound = 'Tape was wound onto a new reel with a slotless hub for transfer and storage.'

        # append results to empty string - tape conditions
        tape_condiions_result = ''
        starts_abruptly = request.form.get('starts_abruptly')
        ends_abruptly = request.form.get('ends_abruptly')
        ground_hum = request.form.get('ground_hum')
        distortion = request.form.get('distortion')
        intermittent_dropouts = request.form.get('intermittent_dropouts')

        # this adds each selection the user checks and adds it to single str
        if starts_abruptly:
            tape_condiions_result = tape_condiions_result + ',' + starts_abruptly
        if ends_abruptly:
            tape_condiions_result = tape_condiions_result + ',' + ends_abruptly
        if ground_hum:
            tape_condiions_result = tape_condiions_result + ',' + ground_hum
        if distortion:
            tape_condiions_result = tape_condiions_result + ',' + distortion
        if intermittent_dropouts:
            tape_condiions_result = tape_condiions_result + ',' + intermittent_dropouts            
        
        # return str if checked
        cwf_normalisation = request.form.get('cwf_normalisation')
        if cwf_normalisation == 'Yes':
            cwf_normalisation = 'The access file was peak normalized to -1dBfs and sample rate converted to 44.1 kHz using Cube-tec Dobbin in CubeWorkflow.'
        
        # append results to empty string - audio analysis
        audiofile_inspector = request.form.get('audiofile_inspector')
        digital_error_checker = request.form.get('digital_error_checker')
        damage_detector = request.form.get('damage_detector')
        applause_detector = request.form.get('applause_detector')
        mpeg_audio_check = request.form.get('mpeg_audio_check')
        media_info = request.form.get('media_info')

        # add each audio selection to single str
        audiofile_result = ''
        if audiofile_inspector:
            audiofile_result = audiofile_result + ',' + audiofile_inspector
        if digital_error_checker:
            audiofile_result = audiofile_result + ',' + digital_error_checker
        if damage_detector:
            audiofile_result = audiofile_result + ',' + damage_detector
        if applause_detector:
            audiofile_result = audiofile_result + ',' + applause_detector
        if mpeg_audio_check:
            audiofile_result = audiofile_result + ',' + mpeg_audio_check
        if media_info:
            audiofile_result = audiofile_result + ',' + media_info

        # append results to empty string - processing
        equalization = request.form.get('equalization')
        compression = request.form.get('compression')
        limiting = request.form.get('limiting')
        reverb = request.form.get('reverb')
        delay = request.form.get('delay')

        # add each processing selection to single str
        processing_result = ''
        if equalization:
            processing_result= processing_result + ',' + equalization
        if compression:
            processing_result= processing_result + ',' + compression
        if limiting:
            processing_result= processing_result + ',' + limiting
        if reverb:
            processing_result= processing_result + ',' + reverb
        if delay:
            processing_result= processing_result + ',' + delay

        # append results to empty string - tools
        pro_tools = request.form.get('pro_tools')
        logic_pro = request.form.get('logic_pro')
        cubase = request.form.get('cubase')
        ableton_live = request.form.get('ableton_live')
        studio_one = request.form.get('studio_one')

        # add each tools selection to single str
        tools_result = ''
        if pro_tools:
            tools_result = tools_result + ',' + pro_tools
        if logic_pro:
            tools_result = tools_result + ',' + logic_pro
        if cubase:
            tools_result = tools_result + ',' + cubase
        if ableton_live:
            tools_result = tools_result + ',' + ableton_live
        if studio_one:
            tools_result = tools_result + ',' + studio_one

        # append results to empty string - security
        encrypted_storage = request.form.get('encrypted_storage')
        user_authentication = request.form.get('user_authentication')
        access_control = request.form.get('access_control')
        data_backup = request.form.get('data_backup')
        secure_file_transfer = request.form.get('secure_file_transfer')

        # add each security selection to single str
        security_results = ''
        if encrypted_storage:
            security_results = security_results + ',' + encrypted_storage
        if user_authentication:
            security_results = security_results + ',' + user_authentication
        if data_backup:
            security_results = security_results + ',' + data_backup
        if access_control:
            security_results = security_results + ',' + access_control
        if secure_file_transfer:
            security_results = security_results + ',' + secure_file_transfer
        

        # append results to empty string - restoration
        azimuth = request.form.get('azimuth')
        declicker = request.form.get('declicker')
        declipper = request.form.get('declipper')
        denoiser = request.form.get('denoiser')
        descratcher = request.form.get('descratcher')
        playback_eq = request.form.get('playback_eq')
        special_dethiss = request.form.get('special_dethiss')
        debuzz = request.form.get('debuzz')

        # add resoration selections to single str
        restorations_result = ''
        if azimuth:
            restorations_result = restorations_result + ',' + azimuth
        if declipper:
            restorations_result = restorations_result + ',' + declipper
        if declicker:
            restorations_result = restorations_result + ',' + declicker
        if denoiser:
            restorations_result = restorations_result + ',' + denoiser
        if descratcher:
            restorations_result = restorations_result + ',' + descratcher
        if playback_eq:
            restorations_result = restorations_result + ',' + playback_eq
        if special_dethiss:
            restorations_result = restorations_result + ',' + special_dethiss
        if debuzz:
            restorations_result = restorations_result + ',' + debuzz
        

        # append results to empty string - conversion
        dBpoweramp = request.form.get('dBpoweramp')
        audacity = request.form.get('audacity')
        adobe_audition = request.form.get('adobe_audition')
        xld_lossless_decoder = request.form.get('xld_lossless_decoder')
        foobar2000 = request.form.get('foobar2000')

        # add conversion selections to single str
        conversion_results = ''
        if dBpoweramp:
            conversion_results = conversion_results + ',' + dBpoweramp    
        if audacity:
            conversion_results = conversion_results + ',' + audacity    
        if adobe_audition:
            conversion_results = conversion_results + ',' + adobe_audition    
        if xld_lossless_decoder:
            conversion_results = conversion_results + ',' + xld_lossless_decoder    
        if foobar2000:
            conversion_results = conversion_results + ',' + foobar2000            

        # append results to empty string - tektronix
        waveform = request.form.get('waveform_monitor')
        master_sync = request.form.get('master_sync')
        media_analysis_platform = request.form.get('media_analysis_platform')
        waveform_rasterizer = request.form.get('waveform_rasterizer')

        # add tektronix selections to single str
        tektronix_results = ''
        if waveform:
            tektronix_results = tektronix_results + ',' + waveform
        if master_sync:
            tektronix_results = tektronix_results + ',' + master_sync
        if media_analysis_platform:
            tektronix_results = tektronix_results + ',' + media_analysis_platform
        if waveform_rasterizer:
            tektronix_results = tektronix_results + ',' + waveform_rasterizer

        # append results to empty string - workflow
        trello = request.form.get('trello')
        asana = request.form.get('asana')
        monday = request.form.get('monday')
        wrike = request.form.get('wrike')
        jira = request.form.get('jira')

        # add workflow seletions to single str
        workflow_result = ''
        if trello:
            workflow_result = workflow_result + ',' + trello
        if asana:
            workflow_result = workflow_result + ',' + asana
        if monday:
            workflow_result = workflow_result + ',' + monday
        if wrike:
            workflow_result = workflow_result + ',' + wrike
        if jira:
            workflow_result = workflow_result + ',' + jira

        # if no tape_baked selected
        if tape_baked == None:
            tape_baked_error = 'Taped Baked Error'
            return jsonify({tape_baked_error: incomplete_form_error})
        
        # if azimuth_adjusted not selected
        if azimuth_adjusted == None:
            azimuth_adjusted_error = 'Azimuth Adjusted Error'
            return jsonify({azimuth_adjusted_error: incomplete_form_error})
        
        # if tape_wond not selected
        if tape_wound == None:
            tape_wound_error = 'Tape Wound Error'
            return jsonify({tape_wound_error: incomplete_form_error})
        
        # if cwf_normalisation not selected
        if cwf_normalisation == None:
            cwf_normalisation_error = 'CWF Normalisation Error'
            return jsonify({cwf_normalisation_error: incomplete_form_error})
        
        # if tape_condiions_result is empty
        if tape_condiions_result == '':
            tape_condiions_error = 'Tape Conditions Error'
            return jsonify({tape_condiions_error: incomplete_form_error})

        # if audiofile_result is empty
        if audiofile_result == '':
            audiofile_error = 'Audio File Error'
            return jsonify({audiofile_error: incomplete_form_error})
        
        # if processing_result is empty
        if processing_result == '':
            processing_error = 'Processing Method Error'
            return jsonify({processing_error: incomplete_form_error})
        
        # if tools_result is empty
        if tools_result == '':
            tools_used_error = 'Tools Used Error'
            return jsonify({tools_used_error: incomplete_form_error})
        
        # if tools_result is empty
        if tektronix_results == '':
            tektronix_error = 'Tektronix Error'
            return jsonify({tektronix_error: incomplete_form_error})

        # save form data to database
        # collect data from form
        new_data = Data(
            music_name=music_name,
            genre_type=genre_type,
            artist_name=artist_name,
            date_time=date_time,
            tape_baked=tape_baked,
            azimuth_adjusted=azimuth_adjusted,
            tape_wound=tape_wound,
            tape_conditions=tape_condiions_result[1:],
            cwf_normalisation=cwf_normalisation,
            audio_analysis=audiofile_result[1:],
            decoder=decoder,
            processing=processing_result[1:],
            tools_used=tools_result[1:],
            encoder=encoder,
            security=security_results[1:],
            restoration=restorations_result[1:],
            conversion=conversion_results[1:],
            tektronix=tektronix_results[1:],
            video=video_tools,
            workflow=workflow_result[1:],
            additional_comments=additional_comments
        )
        # save data to database
        db.session.add(new_data)
        db.session.commit()

        if new_data != None:
            ok_message = 'Thank you for completing this survey, your survey has been saved!'
            return render_template('index.html', ok_message=ok_message, new_data=new_data)

        return render_template('index.html')  


@app.route('/results')
def get_results():

    get_data = Data.query.all()

    # return database data to webpage
    return render_template('results.html', get_data=get_data)
    
if __name__ == "__main__":
    debug = False
    if debug:
        app.run(debug=True)
    else:
        FlaskUI(
            app=app,
            height=500,
            width=500,
            server="flask"
        ).run()