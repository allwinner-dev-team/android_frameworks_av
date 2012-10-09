LOCAL_PATH:= $(call my-dir)

#
# libmediaplayerservice
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=               \
    ActivityManager.cpp         \
    Crypto.cpp                  \
    MediaRecorderClient.cpp     \
    MediaPlayerService.cpp      \
    MetadataRetrieverClient.cpp \
    TestPlayerStub.cpp          \
    MidiMetadataRetriever.cpp   \
    MidiFile.cpp                \
    CedarPlayer.cpp       		\
    StagefrightPlayer.cpp       \
    StagefrightRecorder.cpp		\
    CedarAPlayerWrapper.cpp		\
    SimpleMediaFormatProbe.cpp	\
    MovAvInfoDetect.cpp

LOCAL_SHARED_LIBRARIES :=     		\
	libcutils             			\
	libutils              			\
	libbinder             			\
	libvorbisidec         			\
	libsonivox            			\
	libmedia              			\
	libmedia_native       			\
	libcamera_client      			\
	libCedarX           			\
	libCedarA           			\
	libstagefright        			\
	libstagefright_omx    			\
	libstagefright_foundation       \
	libgui                          \
	libdl                           \
	libaah_rtp

LOCAL_STATIC_LIBRARIES := \
        libstagefright_nuplayer                 \
        libstagefright_rtsp                     \

LOCAL_C_INCLUDES :=                                               \
	$(call include-path-for, graphics corecg)                       \
	$(TOP)/external/cedarx/CedarXAndroid/IceCreamSandwich \
	$(TOP)/external/cedarx/CedarX/include/include_audio \
	$(TOP)/external/cedarx/CedarX/include/include_cedarv \
	$(TOP)/external/cedarx/CedarX/include \
	$(TOP)/external/cedarx/CedarA \
	$(TOP)/external/cedarx/CedarA/include \
	$(TOP)/frameworks/av/media/libstagefright/include               \
	$(TOP)/frameworks/av/media/libstagefright/rtsp                  \
	$(TOP)/frameworks/native/include/media/openmax                  \
	$(TOP)/external/tremolo/Tremolo                                 \

LOCAL_CFLAGS +=-DCEDARX_ANDROID_VERSION=7

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_STATIC_LIBRARIES += libmedia_helper
	LOCAL_C_INCLUDES += $(TOP)/frameworks/av/include/media
endif

LOCAL_MODULE:= libmediaplayerservice

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))

